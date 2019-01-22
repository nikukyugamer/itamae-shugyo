if ENV['PROVISIONED_USERNAME'] == 'root'
  PROVISIONED_DIRECTORY = '/root'
else
  PROVISIONED_DIRECTORY = "/home/#{ENV['PROVISIONED_USERNAME']}"
end

execute 'Create a .ssh directory if it does not exist' do
  user ENV['PROVISIONED_USERNAME']
  command "mkdir -p #{PROVISIONED_DIRECTORY}/.ssh"
end

remote_file "#{PROVISIONED_DIRECTORY}/.ssh/#{ENV['GITHUB_PRIVATE_KEY_PROVISIONED_FILENAME']}" do
  source ENV['GITHUB_PRIVATE_KEY_SOURCE_FILE']
  content 'Copy GitHub SSH private key'
  mode '600'
  owner ENV['PROVISIONED_USERNAME']
  group ENV['PROVISIONED_USERNAME']
end

# 仮の .ssh/config を最初に送る
remote_file "#{PROVISIONED_DIRECTORY}/.ssh/config" do
  source ENV['PROVISIONED_USER_SSH_CONFIG_FILE']
  content 'Copy SSH config base file'
  mode '600'
  owner ENV['PROVISIONED_USERNAME']
  group ENV['PROVISIONED_USERNAME']
end

# 送った .ssh/config の中の、鍵の path を設定する（環境変数を用いて DRY に）
file "#{PROVISIONED_DIRECTORY}/.ssh/config" do
  action :edit
  block do |content|
    content.gsub!('IDENTITY_FILE_PATH', "~/.ssh/#{ENV['GITHUB_PRIVATE_KEY_FILENAME']}")
  end
end
