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

# update icon
package "unzip" do
  action :install
end
execute "backup spotify resource.zip folder" do
  command "cp /opt/spotify/spotify-client/Data/resources.zip /tmp/resources_old.zip"
  action :run
end
execute "unzip current resources folder" do
  command "unzip -o /tmp/resources_old.zip -d /tmp/resources_old/"
  action :run
end
remote_file "/tmp/resources_old/_linux/spotify_icon.ico" do
  source "https://raw.githubusercontent.com/faviouz/fix-spotify-icon/master/spotify_icon.ico"
end
execute "rezip resources" do
  command "cd /tmp/resources_old && zip -rp /tmp/resources_patched.zip . && cd -"
  action :run
end
execute "copy recompiled resources back to spotify" do
  command "cp /tmp/resources_patched.zip /opt/spotify/spotify-client/Data/resources.zip"
  action :run
end
