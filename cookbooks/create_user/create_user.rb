include_recipe '../../secret/username_and_password.rb'

remote_file "/etc/login.defs" do
  owner "root"
  group "root"
  source "./login.defs"
end

shell = "/bin/bash"
root_group = "admin"

execute "useradd" do
  command "sudo useradd -s #{shell} -p `echo #{$password} | mkpasswd -s -m sha-512` #{$username}"
end

execute "usermod" do
  command "sudo usermod -G #{root_group} #{$username}"
end
