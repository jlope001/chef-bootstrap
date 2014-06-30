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

# uninstall useless packages
%w{unity-lens-shopping}.each do |pkg|
  package pkg do
    action :install
  end
end
