remote_file "/etc/sudoers" do
  source ENV['SUDOERS_FILE']
  content 'Copy sudoers file'
  mode '440'
  owner 'root'
  group 'root'
end

