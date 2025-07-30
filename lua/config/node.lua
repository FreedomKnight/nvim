-- Global Node.js environment setup for all plugins
local node_utils = require('utils.node')

-- Set up Node.js environment on startup
node_utils.setup_node_env()

return {}