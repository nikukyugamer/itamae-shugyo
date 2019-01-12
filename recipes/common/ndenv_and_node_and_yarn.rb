git "/home/#{ENV['PROVISIONED_USERNAME']}/.ndenv" do
  user ENV['PROVISIONED_USERNAME']
  repository 'https://github.com/riywo/ndenv'
end

git "/home/#{ENV['PROVISIONED_USERNAME']}/.ndenv/plugins/node-build" do
  user ENV['PROVISIONED_USERNAME']
  repository 'https://github.com/riywo/node-build.git'
end

execute 'Build Node.js' do
  user ENV['PROVISIONED_USERNAME']
  command "/home/#{ENV['PROVISIONED_USERNAME']}/.ndenv/bin/ndenv install -f #{ENV['INSTALLED_NODEJS_VERSION']}"
end

execute 'Install Node.js' do
  user ENV['PROVISIONED_USERNAME']
  command "/home/#{ENV['PROVISIONED_USERNAME']}/.ndenv/bin/ndenv global #{ENV['INSTALLED_NODEJS_VERSION']}"
end

execute 'Install Yarn' do
  user ENV['PROVISIONED_USERNAME']
  command "/home/#{ENV['PROVISIONED_USERNAME']}/.ndenv/shims/npm install -g yarn"
end
