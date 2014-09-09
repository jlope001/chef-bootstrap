case node['platform']

# install ubuntu vagrant
when 'ubuntu'
  # install vagrant
  vagrant_deb_filename = "vagrant_1.6.5_x86_64.deb"
  remote_file "/tmp/#{vagrant_deb_filename}" do
    source "https://dl.bintray.com/mitchellh/vagrant/#{vagrant_deb_filename}"
    mode 0644
    checksum "e2c7af6d032ac551ebd6399265cb9cb64402c9fb96a12289161b7f67afada28a"
  end

  dpkg_package "vagrant" do
    source "/tmp/#{vagrant_deb_filename}"
    action :install
  end

  file "/tmp/#{vagrant_deb_filename}" do
    action :delete
  end

# install centos
when 'centos'
  vagrant_rpm_filename = "vagrant_1.6.5_x86_64.rpm"
  remote_file "/tmp/#{vagrant_rpm_filename}" do
    source "https://dl.bintray.com/mitchellh/vagrant/#{vagrant_rpm_filename}"
    mode 0644
    checksum "90730fd10cbd811969ec58f28818685f3074f8399852dfd1d4858d75c4224fdc"
  end

  rpm_package "vagrant" do
    action :install
    source "/tmp/#{vagrant_rpm_filename}"
  end

  file "/tmp/#{vagrant_rpm_filename}" do
    action :delete
  end
end


# install vagrant berkshelf
execute "install vagrant berkshelf plugin" do
  command "USE_SYSTEM_GECODE=1; NOKOGIRI_USE_SYSTEM_LIBRARIES=1; vagrant plugin install --verbose vagrant-berkshelf --plugin-version '>= 2.0.1'"
  action  :run
  user    node[:bootstrap][:user]
  group   node[:bootstrap][:user]
  environment ({'HOME' => "/home/#{node[:bootstrap][:user]}"})
end
