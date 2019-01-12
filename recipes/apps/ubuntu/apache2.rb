%w(apache2).each do |pkg|
  package pkg do
    action :install
  end
end
