remote_file "/home/#{ENV['PROVISIONED_USERNAME']}/.vimrc" do
  source ENV['VIMRC_FILE']
  content 'Copy Vim config file'
  owner ENV['PROVISIONED_USERNAME']
  group ENV['PROVISIONED_USERNAME']
end
