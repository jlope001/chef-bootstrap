apt_repository 'spotify' do
  uri          'http://repository.spotify.com'
  distribution  'stable'
  components   ['non-free']
  keyserver    'keyserver.ubuntu.com'
  key          'BBEBDCB318AD50EC6865090613B00F1FD2C19886'
end
package "spotify-client" do
 action :install
end
