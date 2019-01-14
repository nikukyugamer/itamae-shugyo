%w(tig).each do |pkg|
  package pkg do
    action :install
  end
end
