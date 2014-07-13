# install dependency
package "avahi-daemon" do
  action :install
end

apt_repository 'plex' do
  uri          'http://plex.r.worldssl.net/PlexMediaServer/ubuntu-repo'
  distribution 'lucid'
  components   ['main']
end

package "plexmediaserver" do
  action :install
end

# after the install - the package installs its own source, remove default
apt_repository 'plex' do
  action :remove
end
