%w(mysql-server).each do |pkg|
  package pkg do
    action :install
  end
end

execute 'Create MySQL User' do
  command %q(sudo mysql -e "CREATE USER FOOBAR IDENTIFIED BY 'FOOBAR_PASSWORD'; GRANT ALL ON *.* TO 'FOOBAR'@'%';")
end

YOUR_DATABASE_NAME = 'awesome_database'.freeze
execute 'Create MySQL DATABASE' do
  command %(sudo mysql -e "CREATE DATABASE #{YOUR_DATABASE_NAME} CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;")
end

# 文字コード
# /etc/mysql/mysql.conf.d/mysqld.cnf
# [mysqld]
# character-set-server=utf8mb4
# /etc/mysql/conf.d/mysql.cnf
# [mysql]
# default-character-set=utf8mb4
