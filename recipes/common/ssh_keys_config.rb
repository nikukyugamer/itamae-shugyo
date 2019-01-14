# TODO: 秘密鍵のファイルを生で置くのは大変に良くない
# TODO: デフォルトだとログに出力されるので大変に良くない
remote_file "/home/#{ENV['PROVISIONED_USERNAME']}/.ssh/#{ENV['GITHUB_PRIVATE_KEY_FILENAME']}" do
  source ENV['GITHUB_PRIVATE_KEY_FILE']
  content 'Copy GitHub SSH private key'
  mode '600'
  owner ENV['PROVISIONED_USERNAME']
  group ENV['PROVISIONED_USERNAME']
end

# ベースとなるファイルを転送して、その後テキストを置換する（環境変数を用いた冪等性を確保したいから）
remote_file "/home/#{ENV['PROVISIONED_USERNAME']}/.ssh/config" do
  source ENV['PROVISIONED_USER_SSH_CONFIG_FILE']
  content 'Copy SSH config base file'
  mode '600'
  owner ENV['PROVISIONED_USERNAME']
  group ENV['PROVISIONED_USERNAME']
end

file "/home/#{ENV['PROVISIONED_USERNAME']}/.ssh/config" do
  action :edit
  block do |content|
    content.gsub!('FOOBAR', "~/.ssh/#{ENV['GITHUB_PRIVATE_KEY_FILENAME']}")
  end
end