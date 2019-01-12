require 'dotenv/load'

include_recipe '../recipes/aws_ubuntu/apt_get'
include_recipe '../recipes/common/create_swap_area'

include_recipe '../recipes/common/zsh'
include_recipe '../recipes/common/ssh'

include_recipe '../recipes/common/vimrc'
include_recipe '../recipes/common/fzf'

include_recipe '../recipes/common/goenv_and_golang'
include_recipe '../recipes/common/golang_apps'
include_recipe '../recipes/common/ndenv_and_node_and_yarn'
include_recipe '../recipes/common/pyenv_and_python'
include_recipe '../recipes/common/rbenv_and_ruby'

include_recipe '../recipes/aws_ubuntu/locale'
include_recipe '../recipes/common/change_hostname'
include_recipe '../recipes/common/change_sshd_config'
