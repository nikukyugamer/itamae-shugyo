require 'dotenv/load'

include_recipe '../recipes/conoha_ubuntu/apt_get_update'
include_recipe '../recipes/conoha_ubuntu/apt_get_install'
include_recipe '../recipes/conoha_ubuntu/locale'

include_recipe '../recipes/conoha_ubuntu/add_new_user'
include_recipe '../recipes/conoha_ubuntu/sudoers'
include_recipe '../recipes/conoha_ubuntu/zsh'
include_recipe '../recipes/common/ssh_keys_config'

include_recipe '../recipes/common/vimrc'
include_recipe '../recipes/common/fzf'

include_recipe '../recipes/common/goenv_and_golang'
include_recipe '../recipes/common/golang_apps'
include_recipe '../recipes/common/ndenv_and_node_and_yarn'
include_recipe '../recipes/common/pyenv'
include_recipe '../recipes/common/python' # 遅い
include_recipe '../recipes/common/rbenv'
include_recipe '../recipes/common/ruby' # 遅い

include_recipe '../recipes/common/tig'
include_recipe '../recipes/conoha_ubuntu/mysql_server'
include_recipe '../recipes/conoha_ubuntu/postgresql'
include_recipe '../recipes/conoha_ubuntu/redis_server'
include_recipe '../recipes/conoha_ubuntu/mongodb'
include_recipe '../recipes/conoha_ubuntu/openjdk_8_jre'
include_recipe '../recipes/conoha_ubuntu/embulk'
include_recipe '../recipes/conoha_ubuntu/heroku_cli'

include_recipe '../recipes/common/change_hostname'
include_recipe '../recipes/common/change_sshd_config'

include_recipe '../recipes/conoha_ubuntu/apt_get_dist_upgrade'

