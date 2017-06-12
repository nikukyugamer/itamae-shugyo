execute "prohibit general user login with password" do
  command 'sudo sed -i -e "s/#PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config'
end
