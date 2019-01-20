# basic_ncsa_auth, htpasswd and ...
%w(httpd-tools).each do |pkg|
  package pkg do
    action :install
  end
end
