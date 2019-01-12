remote_file '/etc/ssh/sshd_config' do
  source ENV['PROVISIONED_SSHD_CONFIG_FILE']
  content 'Copy sshd_config file'
  owner 'root'
  group 'root'
end

service 'sshd' do
  action :restart
end
