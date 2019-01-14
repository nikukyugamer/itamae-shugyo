require 'dotenv/load'

include_recipe '../recipes/conoha_ubuntu/apt_get'

include_recipe '../recipes/common/zsh'
include_recipe '../recipes/common/ssh_keys_config'

include_recipe '../recipes/common/vimrc'
include_recipe '../recipes/common/fzf'

include_recipe '../recipes/common/goenv_and_golang'
include_recipe '../recipes/common/golang_apps'
include_recipe '../recipes/common/ndenv_and_node_and_yarn'
include_recipe '../recipes/common/pyenv_and_python'
include_recipe '../recipes/common/rbenv_and_ruby'

include_recipe '../recipes/common/tig'
include_recipe '../recipes/conoha_ubuntu/mysql_server'
include_recipe '../recipes/conoha_ubuntu/postgresql'
include_recipe '../recipes/conoha_ubuntu/redis_server'
include_recipe '../recipes/conoha_ubuntu/mongodb'
include_recipe '../recipes/conoha_ubuntu/openjdk_8_jre'
include_recipe '../recipes/conoha_ubuntu/embulk'
include_recipe '../recipes/conoha_ubuntu/heroku_cli'

include_recipe '../recipes/conoha_ubuntu/locale'
include_recipe '../recipes/common/change_hostname'
include_recipe '../recipes/common/change_sshd_config'
