# Note: You need to install 'expect'

if ENV['PROVISIONED_USERNAME'] == 'root'
  PROVISIONED_DIRECTORY = '/root'
else
  PROVISIONED_DIRECTORY = "/home/#{ENV['PROVISIONED_USERNAME']}"
end

# execute 'git clone fzf manually' do
  # user ENV['PROVISIONED_USERNAME']
  # command 'git clone --depth 1 https://github.com/junegunn/fzf.git .fzf'
# end

git "#{PROVISIONED_DIRECTORY}/.fzf" do
  user ENV['PROVISIONED_USERNAME']
  repository 'https://github.com/junegunn/fzf.git'
  revision 'master'
  action :sync
end

remote_file "#{PROVISIONED_DIRECTORY}/install_fzf.sh" do
  source ENV['FZF_INSTALL_SCRIPT']
  content 'Install fzf'
  mode '755'
  owner ENV['PROVISIONED_USERNAME']
  group ENV['PROVISIONED_USERNAME']
end

execute 'Install fzf' do
  user ENV['PROVISIONED_USERNAME']
  command "#{PROVISIONED_DIRECTORY}/install_fzf.sh"
end

file "#{PROVISIONED_DIRECTORY}/install_fzf.sh" do
  action :delete
end
