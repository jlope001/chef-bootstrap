# install base packages
%w{curl git vim chromium-browser keepassx guake rdiff-backup}.each do |pkg|
  package pkg do
    action :install
  end
end

# system tray software
%w{indicator-multiload hamster-indicator indicator-cpufreq}.each do |pkg|
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


# gnomefs
apt_repository 'gencfsm' do
  keyserver    'keyserver.ubuntu.com'
  key          '0F68ADCA'
  uri          'http://ppa.launchpad.net/gencfsm/ppa/ubuntu'
  distribution distribution  node[:bootstrap][:distribution]
  components   ['main']
  keyserver    'keyserver.ubuntu.com'
  key          'C300EE8C'
end
package "gnome-encfs-manager" do
  action :install
end

