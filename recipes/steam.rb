# install vagrant
deb_filename = "steam.deb"
remote_file "/tmp/#{deb_filename}" do
  source "http://media.steampowered.com/client/installer/#{deb_filename}"
  mode 0644
end

dpkg_package "steam" do
  source "/tmp/#{deb_filename}"
  action :install
end

file "/tmp/#{deb_filename}" do
  action :delete
end
