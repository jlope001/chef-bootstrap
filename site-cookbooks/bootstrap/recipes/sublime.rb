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

path = "/home/#{node[:bootstrap][:user]}/.config/sublime-text-3"
[
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
