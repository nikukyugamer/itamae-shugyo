include_recipe '../../secret/username.rb'

directory "/home/#{$username}/.ssh" do
  mode "700"
  owner "#{$username}"
  group "#{$username}"
end

remote_file "/home/#{$username}/.ssh/authorized_keys" do
  source "../../secret/authorized_keys"
  mode "600"
  owner "#{$username}"
  group "#{$username}"
end

service "sshd" do
  action :restart
end
