include_recipe '../../secret/username.rb'
include_recipe '../../secret/password_samba.rb'

package "samba" do
  action :install
end

execute "append share_name samba_conf" do
  command "echo '[#{$username}]' >> /etc/samba/smb.conf"
end

execute "append share_dir samba_conf" do
  command "echo 'path = /' >> /etc/samba/smb.conf"
end

execute "append writable samba_conf" do
  command "echo 'writable = yes' >> /etc/samba/smb.conf"
end

execute "pdbedit" do
  command "sudo echo -e '#{$password}\\n#{$password}\\n' | sudo pdbedit -t -a -u #{$username}"
end

service "smbd" do
  action :restart
end
