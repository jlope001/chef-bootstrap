# system tray software
%w{guake indicator-multiload hamster-indicator indicator-cpufreq}.each do |pkg|
  package pkg do
    action :install
  end
end

directory "/home/#{node[:bootstrap][:user]}/.config/autostart" do
  owner node[:bootstrap][:user]
  group node[:bootstrap][:user]
  mode 00755
  action :create
end

# install startup systray items
template "/home/#{node[:bootstrap][:user]}/.config/autostart/hamster-applet.desktop" do
  source "systray/hamster.conf.rb"
  owner node[:bootstrap][:user]
  group node[:bootstrap][:user]
end
template "/home/#{node[:bootstrap][:user]}/.config/autostart/guake.desktop" do
  source "systray/guake.conf.rb"
  owner node[:bootstrap][:user]
  group node[:bootstrap][:user]
end
template "/home/#{node[:bootstrap][:user]}/.config/autostart/indicator-multiload.desktop" do
  source "systray/multiload.conf.rb"
  owner node[:bootstrap][:user]
  group node[:bootstrap][:user]
end

# my weather indicator
apt_repository 'weather' do
  uri          'http://ppa.launchpad.net/atareao/atareao/ubuntu'
  distribution  node[:bootstrap][:distribution]
  components   ['main']
  keyserver    'keyserver.ubuntu.com'
  key          '36FD5529'
end
package "my-weather-indicator" do
  action :install
end
template "/home/#{node[:bootstrap][:user]}/.config/autostart/weather-indicator.desktop" do
  source "systray/weather.conf.rb"
  owner node[:bootstrap][:user]
  group node[:bootstrap][:user]
end

# wallpaper
apt_repository 'variety' do
  uri          'http://ppa.launchpad.net/peterlevi/ppa/ubuntu'
  distribution  node[:bootstrap][:distribution]
  components   ['main']
  keyserver    'keyserver.ubuntu.com'
  key          'A546BE4F'
end
package "variety" do
  action :install
end
template "/home/#{node[:bootstrap][:user]}/.config/autostart/variety.desktop" do
  source "systray/variety.conf.rb"
  owner node[:bootstrap][:user]
  group node[:bootstrap][:user]
end
