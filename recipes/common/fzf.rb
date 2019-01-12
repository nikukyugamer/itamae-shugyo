git "/home/#{ENV['PROVISIONED_USERNAME']}/.fzf" do
  user ENV['PROVISIONED_USERNAME']
  repository 'https://github.com/junegunn/fzf.git'
  action :sync
end

remote_file "/home/#{ENV['PROVISIONED_USERNAME']}/install_fzf.sh" do
  source ENV['FZF_INSTALL_SCRIPT']
  content 'Install fzf'
  mode '755'
  owner ENV['PROVISIONED_USERNAME']
  group ENV['PROVISIONED_USERNAME']
end

execute 'Install fzf' do
  user ENV['PROVISIONED_USERNAME']
  command "/home/#{ENV['PROVISIONED_USERNAME']}/install_fzf.sh"
end

file "/home/#{ENV['PROVISIONED_USERNAME']}/install_fzf.sh" do
  action :delete
end
