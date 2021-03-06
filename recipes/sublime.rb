# install sublime
apt_repository 'sublime' do
  keyserver    'keyserver.ubuntu.com'
  uri          'http://ppa.launchpad.net/webupd8team/sublime-text-3/ubuntu'
  distribution  node[:bootstrap][:distribution]
  components   ['main']
  keyserver    'keyserver.ubuntu.com'
  key          'EEA14886'
end
package "sublime-text-installer" do
  action :install
end

# create config folders
path = "/home/#{node[:bootstrap][:user]}/.config/sublime-text-3"
[
  path,
	"#{path}/Installed\ Packages",
	"#{path}/Packages",
	"#{path}/Packages/User",
	].each do |path|
  directory path do
    owner node[:bootstrap][:user]
    group node[:bootstrap][:user]
    mode 00755
    action :create
  end
end

# setup package control
remote_file "#{path}/Installed Packages/Package Control.sublime-package" do
  source "http://sublime.wbond.net/Package%20Control.sublime-package"
end

# setup python - flake8 plugin
git "#{path}/Packages/Python Flake8 Lint" do
  repository "git://github.com/dreadatour/Flake8Lint.git"
  action :checkout
end
regex = "\\\"popup\\\": true\\\,"
replacement = "\\\"popup\\\": false\\\,"
execute "remove popup notifications on python save" do
  command "sed -i \"s/#{regex}/#{replacement}/g\" #{path}/Packages/Python\\ Flake8\\ Lint/Flake8Lint.sublime-settings"
  action :run
end

# install other packages via config file - it will load up on next run
template "#{path}/Packages/User/Package Control.sublime-settings" do
  source "sublime/packages.conf.json"
  owner node[:bootstrap][:user]
  group node[:bootstrap][:user]
end

# setup configuration
template "#{path}/Packages/User/Preferences.sublime-settings" do
  source "sublime/preferences.global.conf.json"
  owner node[:bootstrap][:user]
  group node[:bootstrap][:user]
end
template "#{path}/Packages/User/Ruby on Rails.sublime-settings" do
  source "sublime/preferences.ruby.conf.json"
  owner node[:bootstrap][:user]
  group node[:bootstrap][:user]
end
template "#{path}/Packages/User/PythonImproved.sublime-settings" do
  source "sublime/preferences.python.conf.json"
  owner node[:bootstrap][:user]
  group node[:bootstrap][:user]
end
template "#{path}/Packages/User/GoSublime.sublime-settings" do
  source "sublime/preferences.gosublime.conf.json"
  owner node[:bootstrap][:user]
  group node[:bootstrap][:user]
end
template "#{path}/Packages/User/Default\\ \\(Linux\\).sublime-keymap" do
  source "sublime/keymap.conf.json"
  owner node[:bootstrap][:user]
  group node[:bootstrap][:user]
end
