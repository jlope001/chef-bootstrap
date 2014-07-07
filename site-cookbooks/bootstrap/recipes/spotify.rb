apt_repository 'spotify' do
  uri          'http://repository.spotify.com'
  distribution  'stable'
  components   ['non-free']
  keyserver    'keyserver.ubuntu.com'
  key          '94558F59'
end
package "spotify-client" do
  action :install
end
