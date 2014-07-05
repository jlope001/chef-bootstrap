# install vagrant
vagrant_deb_filename = "vagrant_1.6.3_x86_64.deb"
remote_file "/tmp/#{vagrant_deb_filename}" do
  source "https://dl.bintray.com/mitchellh/vagrant/#{vagrant_deb_filename}"
  mode 0644
  checksum "0fc3259cf08b693e3383636256734513ee93bf258f8328efb64e1dde447aadbe"
end

dpkg_package "vagrant" do
  source "/tmp/#{vagrant_deb_filename}"
  action :install
end

file "/tmp/#{vagrant_deb_filename}" do
  action :delete
end

# install vagrant berkshelf
execute "install vagrant berkshelf plugin" do
  command "vagrant plugin install vagrant-berkshelf --plugin-version '>= 2.0.1'"
  action  :run
  user    node[:bootstrap][:user]
  group   node[:bootstrap][:user]
end
