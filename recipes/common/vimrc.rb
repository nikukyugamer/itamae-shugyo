if ENV['PROVISIONED_USERNAME'] == 'root'
  PROVISIONED_DIRECTORY = '/root'
else
  PROVISIONED_DIRECTORY = "/home/#{ENV['PROVISIONED_USERNAME']}"
end

remote_file "#{PROVISIONED_DIRECTORY}/.vimrc" do
  source ENV['VIMRC_FILE']
  content 'Copy Vim config file'
  owner ENV['PROVISIONED_USERNAME']
  group ENV['PROVISIONED_USERNAME']
end
