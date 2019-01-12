execute 'Install pyenv' do
  user ENV['PROVISIONED_USERNAME']
  command 'curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash'
end

execute 'Build Python' do
  user ENV['PROVISIONED_USERNAME']
  command "/home/#{ENV['PROVISIONED_USERNAME']}/.pyenv/bin/pyenv install -f #{ENV['INSTALLED_PYTHON_VERSION']}"
end

execute 'Install Python' do
  user ENV['PROVISIONED_USERNAME']
  command "/home/#{ENV['PROVISIONED_USERNAME']}/.pyenv/bin/pyenv global #{ENV['INSTALLED_PYTHON_VERSION']}"
end
