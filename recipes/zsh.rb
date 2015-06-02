path = "/home/#{node[:bootstrap][:user]}/path"
git path do
  repository "git://github.com/jlope001/dotfiles.git"
  action :checkout
end

bash "install dotfiles" do
  code "./bootstrap.sh"
  cwd     path
  action  :run
  user    node[:bootstrap][:user]
  group   node[:bootstrap][:user]
  environment ({'HOME' => "/home/#{node[:bootstrap][:user]}"})
end

directory path do
  recursive true
  action :delete
end
