# base package
include_recipe "./roles_sets/after_clean_install.rb"

# login configure
include_recipe "../cookbooks/ssh-key/ssh-key.rb"
include_recipe "../cookbooks/my-own-environment/change_ssh_port.rb"

# prohibit password login (for general user)
# include_recipe "../cookbooks/prohibit_password_login/prohibit_password_login.rb"

# storage device mount
include_recipe "../cookbooks/my-own-environment/mount_storage.rb"
include_recipe "../cookbooks/my-own-environment/rc.local.rb"

# programming language
# ruby(rbenv), python, nodejs, php...

# database
# include_recipe "../cookbooks/mysql/mysql.rb"
include_recipe "../cookbooks/postgresql/postgresql.rb"
include_recipe "../cookbooks/sqlite3/sqlite3.rb"
include_recipe "../cookbooks/mongodb/mongodb.rb"

# dev environment (docker, virtualbox, vagrant)
include_recipe "./roles_sets/development_environment.rb"

# samba
# include_recipe "../../cookbooks/samba/samba.rb"

# post processing
execute "sudo apt-get -y dist-upgrade"
execute "sudo apt-get update"
execute "sudo apt-get -y upgrade"
execute "sudo apt-get -y autoremove"
