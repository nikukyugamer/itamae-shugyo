git "/home/#{ENV['PROVISIONED_USERNAME']}/.rbenv" do
  user ENV['PROVISIONED_USERNAME']
  repository 'https://github.com/sstephenson/rbenv.git'
end

git "/home/#{ENV['PROVISIONED_USERNAME']}/.rbenv/plugins/ruby-build" do
  user ENV['PROVISIONED_USERNAME']
  repository 'https://github.com/sstephenson/ruby-build.git'
end
