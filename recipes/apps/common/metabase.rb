execute 'Prepare installing java' do
  command "sudo add-apt-repository 'ppa:openjdk-r/ppa' -y && sudo apt-get update -y"
end

%w(openjdk-8-jdk mysql-server).each do |pkg|
  package pkg do
    action :install
  end
end

LATEST_METABASE_VERSION = 'v0.31.2'.freeze
execute 'Install Metabase' do
  command "sudo mkdir /opt/metamibase ; wget http://downloads.metabase.com/#{LATEST_METABASE_VERSION}/metabase.jar -O /opt/metamibase/metabase.jar"
end
