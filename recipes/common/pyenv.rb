execute 'Install pyenv' do
  user ENV['PROVISIONED_USERNAME']
  command 'curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash'
end
