include_recipe '../../secret/password_mysql.rb'

# prepare
execute "export MYSQLPW=#{$password_mysql}"
execute 'echo "mysql-server mysql-server/root_password password $MYSQLPW" | sudo debconf-set-selections'
execute 'echo "mysql-server mysql-server/root_password_again password $MYSQLPW" | sudo debconf-set-selections'

# install
package "mysql-server" do
  action :install
end

package "mysql-client" do
  action :install
end

# set charset
execute "sudo cp /etc/mysql/conf.d/mysql.cnf /etc/mysql/conf.d/mysql.cnf.original"
execute "sudo cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf.original"
execute "sudo sed -i -e '$ a default-character-set=utf8mb4' /etc/mysql/conf.d/mysql.cnf"
execute "sudo sed -i -e '$ a character-set-server=utf8mb4' /etc/mysql/mysql.conf.d/mysqld.cnf"

# restart
service "mysql" do
  action :restart
end
