require 'dotenv/load'

include_recipe '../recipes/docker_ubuntu/apt_get'

include_recipe '../recipes/common/zsh'
include_recipe '../recipes/common/ssh_keys_config'

include_recipe '../recipes/common/vimrc'
include_recipe '../recipes/common/fzf'

include_recipe '../recipes/common/goenv_and_golang'
include_recipe '../recipes/common/golang_apps'
include_recipe '../recipes/common/ndenv_and_node_and_yarn'
include_recipe '../recipes/common/pyenv'
include_recipe '../recipes/common/rbenv'

# 時間がかかりすぎる
# include_recipe '../recipes/common/python'
# include_recipe '../recipes/common/ruby'

include_recipe '../recipes/common/tig'
include_recipe '../recipes/docker_ubuntu/mysql_server'
include_recipe '../recipes/docker_ubuntu/postgresql'
include_recipe '../recipes/docker_ubuntu/redis_server'
include_recipe '../recipes/docker_ubuntu/mongodb'
include_recipe '../recipes/docker_ubuntu/openjdk_8_jre'
include_recipe '../recipes/docker_ubuntu/embulk'
include_recipe '../recipes/docker_ubuntu/heroku_cli'
include_recipe '../recipes/docker_ubuntu/unminimize'