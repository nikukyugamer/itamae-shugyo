HOSTNAME = 'foobar-host'.freeze
execute 'Create hostname' do
  command "hostnamectl set-hostname #{HOSTNAME}"
end
