execute 'Initial apt-get dist-upgrade' do
  # "DEBIAN_FRONTEND=noninteractive" and "sudo -E" are for avoiding a interactive installation of "ssh-server" and "grub"
  command 'DEBIAN_FRONTEND=noninteractive sudo -E apt-get dist-upgrade -y'
end

execute 'Clean package manager' do
  command 'apt-get autoremove -y && sudo apt-get autoclean -y'
end
