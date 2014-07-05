# system tray software
%w{guake indicator-multiload hamster-indicator indicator-cpufreq}.each do |pkg|
  package pkg do
    action :install
  end
end

# install startup systray items
template "/etc/xdg/autostart/hamster-applet.desktop" do
  source "systray/hamster.conf.rb"
  owner node[:bootstrap][:user]
  group node[:bootstrap][:user]
end
template "/etc/xdg/autostart/guake.desktop" do
  source "systray/guake.conf.rb"
  owner node[:bootstrap][:user]
  group node[:bootstrap][:user]
end
template "/etc/xdg/autostart/indicator-multiload.desktop" do
  source "systray/multiload.conf.rb"
  owner node[:bootstrap][:user]
  group node[:bootstrap][:user]
end
