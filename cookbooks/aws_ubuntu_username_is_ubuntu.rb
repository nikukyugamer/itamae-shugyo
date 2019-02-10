require 'dotenv/load'

include_recipe '../recipes/aws_ubuntu/apt_get'
include_recipe '../recipes/common/create_swap_area'

include_recipe '../recipes/common/zsh'
include_recipe '../recipes/common/ssh_keys_config'

include_recipe '../recipes/common/vimrc'
include_recipe '../recipes/common/fzf'

include_recipe '../recipes/common/goenv_and_golang'
include_recipe '../recipes/common/golang_apps'
include_recipe '../recipes/common/ndenv_and_node_and_yarn'
include_recipe '../recipes/common/pyenv'
include_recipe '../recipes/common/python'
include_recipe '../recipes/common/rbenv'
include_recipe '../recipes/common/ruby'

include_recipe '../recipes/common/tig'

include_recipe '../recipes/aws_ubuntu/locale'
include_recipe '../recipes/common/change_hostname'
include_recipe '../recipes/common/change_sshd_config'
