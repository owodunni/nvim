local util = require "lspconfig/util"
return {
    root_dir = util.root_pattern(".git");
    single_file_support = false
}
