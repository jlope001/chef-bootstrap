# install dependency
package "avahi-daemon" do
  action :install
end

apt_repository 'plexmediaserver' do
  uri          'http://www.plexapp.com/repo'
  distribution distribution  node[:bootstrap][:distribution]
  components   ['main']
  # key          'https://www.hipchat.com/keys/hipchat-linux.key'
end

package "plexmediaserver" do
  action :install
end
