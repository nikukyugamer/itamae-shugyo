include_recipe '../../secret/root_password.rb'

execute "passwd_root" do
  command "sudo echo root:#{$root_password} | /usr/sbin/chpasswd"
end
