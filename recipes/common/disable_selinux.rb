execute 'Disable SELinux for nginx reverse proxy and ...' do
  command 'sudo setsebool httpd_can_network_connect on -P'
end
