package "wmctrl" do
  action :install
end

# gnomefs
apt_repository 'gencfsm' do
  keyserver    'keyserver.ubuntu.com'
  uri          'http://ppa.launchpad.net/gencfsm/ppa/ubuntu'
  distribution 'xenial'
  components   ['main']
  keyserver    'keyserver.ubuntu.com'
  key          '0F68ADCA'
end
package "gnome-encfs-manager" do
  action :install
end
