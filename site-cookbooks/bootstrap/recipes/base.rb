# install base packages
%w{curl git vim chromium-browser keepassx rdiff-backup}.each do |pkg|
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
