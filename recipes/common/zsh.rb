remote_file "/home/#{ENV['PROVISIONED_USERNAME']}/.zshrc" do
  source ENV['ZSHRC_FILE']
  content 'Copy zsh config file'
  owner ENV['PROVISIONED_USERNAME']
  group ENV['PROVISIONED_USERNAME']
end

remote_file "/home/#{ENV['PROVISIONED_USERNAME']}/chsh_to_zsh.sh" do
  source ENV['PROVISIONED_CHANGING_ZSH_SCRIPT']
  content 'Copy changing shell to zsh file (Shell script)'
  mode '755'
  owner ENV['PROVISIONED_USERNAME']
  group ENV['PROVISIONED_USERNAME']
end

execute 'Change default shell to zsh' do
  user ENV['PROVISIONED_USERNAME']
  command "/home/#{ENV['PROVISIONED_USERNAME']}/chsh_to_zsh.sh"
end

file "/home/#{ENV['PROVISIONED_USERNAME']}/chsh_to_zsh.sh" do
  action :delete
end
