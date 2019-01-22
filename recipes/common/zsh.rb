if ENV['PROVISIONED_USERNAME'] == 'root'
  PROVISIONED_DIRECTORY = '/root'
else
  PROVISIONED_DIRECTORY = "/home/#{ENV['PROVISIONED_USERNAME']}"
end

%w(zsh).each do |pkg|
  package pkg do
    action :install
  end
end

remote_file "#{PROVISIONED_DIRECTORY}/.zshrc" do
  source ENV['ZSHRC_FILE']
  content 'Copy zsh config file'
  owner ENV['PROVISIONED_USERNAME']
  group ENV['PROVISIONED_USERNAME']
end

remote_file "#{PROVISIONED_DIRECTORY}/chsh_to_zsh.sh" do
  source ENV['PROVISIONED_CHANGING_ZSH_SCRIPT']
  content 'Copy changing shell to zsh file (Shell script)'
  mode '755'
  owner ENV['PROVISIONED_USERNAME']
  group ENV['PROVISIONED_USERNAME']
end

execute 'Change default shell to zsh' do
  user ENV['PROVISIONED_USERNAME']
  command "#{PROVISIONED_DIRECTORY}/chsh_to_zsh.sh"
end

file "#{PROVISIONED_DIRECTORY}/chsh_to_zsh.sh" do
  action :delete
end
