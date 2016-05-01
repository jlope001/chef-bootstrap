path = "/home/#{node[:bootstrap][:user]}/path"
directory "#{path}" do
  owner node[:bootstrap][:user]
  group node[:bootstrap][:user]
  mode '0755'
  action :create
end

git "#{path}" do
  repository "git://github.com/jlope001/dotfiles.git"
  action :checkout
  user    node[:bootstrap][:user]
  group    node[:bootstrap][:user]
end

bash "install dotfiles" do
  code "./bootstrap.sh"
  cwd     "#{path}"
  action  :run
  environment ({'HOME' => "/home/#{node[:bootstrap][:user]}", "USER" => node[:bootstrap][:user]})
end

directory "#{path}" do
  recursive true
  action :delete
end
