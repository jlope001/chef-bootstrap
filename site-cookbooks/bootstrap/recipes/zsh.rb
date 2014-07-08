package "zsh" do
  action :install
end
execute "install oh my zsh" do
  command "wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh"
  action  :run
  user    node[:bootstrap][:user]
  group   node[:bootstrap][:user]
  ignore_failure true
end

execute "update default theme to agnoster" do
  command "sed -i \"s/robbyrussell/agnoster/g\" /home/#{node[:bootstrap][:user]}/.zshrc"
  action :run
end

# install powerline fonts
[
  "/home/#{node[:bootstrap][:user]}/.fonts",
  "/home/#{node[:bootstrap][:user]}/.fonts.conf.d",
  ].each do |path|
  directory path do
    owner node[:bootstrap][:user]
    group node[:bootstrap][:user]
    mode 00755
    action :create
  end
end
remote_file "/home/#{node[:bootstrap][:user]}/.fonts/PowerlineSymbols.otf" do
  source "https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf"
end
remote_file "/home/#{node[:bootstrap][:user]}/.fonts.conf.d/10-powerline-symbols.conf" do
  source "https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf"
end
execute "update font cache" do
  command "fc-cache -vf /home/#{node[:bootstrap][:user]}/.fonts"
  action  :run
  user    node[:bootstrap][:user]
  group   node[:bootstrap][:user]
end

