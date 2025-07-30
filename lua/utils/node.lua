local M = {}

-- Get Node.js path from nvm default version
function M.get_node_path()
  local nvm_default_path = vim.fn.expand('~/.nvm/alias/default')
  if vim.fn.filereadable(nvm_default_path) == 1 then
    local default_version = vim.fn.readfile(nvm_default_path)[1]
    if default_version then
      local node_path = vim.fn.expand('~/.nvm/versions/node/' .. default_version .. '/bin/node')
      
      -- If exact version doesn't exist, try to find the latest version with same major
      if vim.fn.filereadable(node_path) == 0 then
        local major_version = default_version:match('v(%d+)')
        if major_version then
          local versions_dir = vim.fn.expand('~/.nvm/versions/node/')
          local available_versions = vim.fn.glob(versions_dir .. 'v' .. major_version .. '*', false, true)
          if #available_versions > 0 then
            -- Sort and get the latest version
            table.sort(available_versions, function(a, b) return a > b end)
            local latest_version = vim.fn.fnamemodify(available_versions[1], ':t')
            node_path = vim.fn.expand('~/.nvm/versions/node/' .. latest_version .. '/bin/node')
          end
        end
      end
      
      if vim.fn.filereadable(node_path) == 1 then
        return node_path
      end
    end
  end
  
  -- Fallback to system node if nvm default not found
  local system_node = vim.fn.exepath('node')
  if system_node ~= '' then
    return system_node
  end
  
  return nil
end

-- Get npm path from nvm default version
function M.get_npm_path()
  local node_path = M.get_node_path()
  if node_path then
    local npm_path = node_path:gsub('/node$', '/npm')
    if vim.fn.filereadable(npm_path) == 1 then
      return npm_path
    end
  end
  
  -- Fallback to system npm if nvm default not found
  local system_npm = vim.fn.exepath('npm')
  if system_npm ~= '' then
    return system_npm
  end
  
  return nil
end

-- Set Node.js PATH environment for current session
function M.setup_node_env()
  local node_path = M.get_node_path()
  if node_path then
    local node_bin_path = vim.fn.fnamemodify(node_path, ':h')
    local current_path = vim.env.PATH
    if not string.find(current_path, node_bin_path, 1, true) then
      vim.env.PATH = node_bin_path .. ':' .. current_path
    end
  end
end

return M