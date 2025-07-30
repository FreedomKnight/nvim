return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "jay-babu/mason-nvim-dap.nvim",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function ()
      local sign = vim.fn.sign_define
      sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
      sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
      sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})
      vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
      vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
      vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
      vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
      vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end)
      vim.keymap.set('n', '<Leader>dB', function() require('dap').set_breakpoint() end)
      vim.keymap.set('n', '<Leader>dlp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
      vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
      vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
      vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
        require('dap.ui.widgets').hover()
      end)
      vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
        require('dap.ui.widgets').preview()
      end)
      vim.keymap.set('n', '<Leader>df', function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.frames)
      end)
      vim.keymap.set('n', '<Leader>ds', function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.scopes)
      end)

      local dap = require('dap')
      local node_utils = require('utils.node')
      local node_path = node_utils.get_node_path()
      
      dap.adapters.php = {
        type = 'executable',
        command = node_path or 'node',
        args = { '/Users/fk.chen/Documents/vscode-php-debug/out/phpDebug.js' }
      }

      dap.configurations.php = {
        {
          type = 'php',
          request = 'launch',
          name = 'Listen for Xdebug',
          port = 9003,
          pathMappings = {
            ["/var/www/${workspaceFolderBasename}/"] = "${workspaceFolder}"
          }
        }
      }

      local dapui = require('dapui')
      dapui.setup()
      local dapui_open = function()
        dapui.open()
      end
      local dapui_close = function()
        dapui.close()
      end
      vim.keymap.set('n', '<Leader>dt', dapui.toggle)
      dap.listeners.before.attach.dapui_config = dapui_open
      dap.listeners.before.launch.dapui_config = dapui_open
      dap.listeners.before.event_terminated.dapui_config = dapui_close
      dap.listeners.before.event_exited.dapui_config = dapui_close
    end
  },
}
