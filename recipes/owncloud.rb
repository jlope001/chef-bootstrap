apt_repository 'owncloud' do
  uri    'http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/xUbuntu_14.04/'
  components ['/']
  key    'http://download.opensuse.org/repositories/isv:ownCloud:desktop/xUbuntu_14.04/Release.key'
end

package "owncloud-client" do
  action :install
end
