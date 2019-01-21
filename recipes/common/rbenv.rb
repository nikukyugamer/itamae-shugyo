if ENV['PROVISIONED_USERNAME'] == 'root'
  PROVISIONED_DIRECTORY = '/root'
else
  PROVISIONED_DIRECTORY = "/home/#{ENV['PROVISIONED_USERNAME']}"
end

git "#{PROVISIONED_DIRECTORY}/.rbenv" do
  user ENV['PROVISIONED_USERNAME']
  repository 'https://github.com/sstephenson/rbenv.git'
end

git "#{PROVISIONED_DIRECTORY}/.rbenv/plugins/ruby-build" do
  user ENV['PROVISIONED_USERNAME']
  repository 'https://github.com/sstephenson/ruby-build.git'
end
