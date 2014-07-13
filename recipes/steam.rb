# install vagrant
deb_filename = "steam.deb"
remote_file "/tmp/#{deb_filename}" do
  source "http://media.steampowered.com/client/installer/#{deb_filename}"
  mode 0644
  checksum "0fc3259cf08b693e3383636256734513ee93bf258f8328efb64e1dde447aadbe"
end

dpkg_package "steam" do
  source "/tmp/#{deb_filename}"
  action :install
end

file "/tmp/#{deb_filename}" do
  action :delete
end
