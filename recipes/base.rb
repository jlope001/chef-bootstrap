# install base packages
%w{curl git vim chromium-browser keepassx}.each do |pkg|
  package pkg do
    action :install
  end
end

# vm software
%w{nfs-common nfs-kernel-server}.each do |pkg|
  package pkg do
    action :install
  end
end

# vpn software
%w{libnss-myhostname openvpn network-manager-openvpn network-manager-openvpn-gnome}.each do |pkg|
  package pkg do
    action :install
  end
end

# multimedia updates
%w{ubuntu-restricted-extras libxslt-dev libxml2-dev libdvdread4}.each do |pkg|
  package pkg do
    action :install
  end
end
execute "enable dvd playback" do
  command "/usr/share/doc/libdvdread4/install-css.sh"
  action :run
end

# uninstall useless packages
%w{unity-lens-shopping}.each do |pkg|
  package pkg do
    action :install
  end
end
execute "disable privacy settings" do
  command "gsettings set com.canonical.Unity.Lenses disabled-scopes \"['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']\""
  action :run
end

# copy over custom bookmarks - specifically vagrant
template "/home/#{node[:bootstrap][:user]}/.config/gtk-3.0/bookmarks" do
  source "base/bookmarks.conf.rb"
  variables ({
    :user => node[:bootstrap][:user],
  })
  owner node[:bootstrap][:user]
  group node[:bootstrap][:user]
end

# install google talk plugin
deb_filename = "google-talkplugin_current_amd64.deb"
remote_file "/tmp/#{deb_filename}" do
  source "https://dl.google.com/linux/direct/#{deb_filename}"
  mode 0644
end

dpkg_package "google_talk" do
  source "/tmp/#{deb_filename}"
  action :install
end

file "/tmp/#{deb_filename}" do
  action :delete
end
