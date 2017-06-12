package "apache2" do
  action :install
end

package "libapache2-mod-php" do
  action :install
end

package "php-fpm" do
  action :install
end
