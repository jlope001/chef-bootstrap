# install plex media server
version = "0.9.9.12.504-3e7f93c"
deb_filename = "plexmediaserver_#{version}_amd64.deb"
remote_file "/tmp/#{deb_filename}" do
  source "http://downloads.plexapp.com/plex-media-server/#{version}/#{deb_filename}"
  mode 0644
end

dpkg_package "plexmediaserver" do
  source "/tmp/#{deb_filename}"
  action :install
end

file "/tmp/#{deb_filename}" do
  action :delete
end
