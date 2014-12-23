path = "/home/#{node[:bootstrap][:user]}/path"
git path do
  repository "https://github.com/jlope001/dotfiles.git"
  action :checkout
end

execute "install dotfiles" do
  command "./bootstrap.sh"
  cwd     path
  action  :run
  user    node[:bootstrap][:user]
  group   node[:bootstrap][:user]
  environment ({'HOME' => "/home/#{node[:bootstrap][:user]}"})
end

directory path do
  action :delete
end
