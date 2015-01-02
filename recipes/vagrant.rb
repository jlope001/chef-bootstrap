case node['platform']

# install ubuntu vagrant
when 'ubuntu'

  # dependency for vagrant
  package 'libsdl1.2debian' do
    action :install
  end

  # install vagrant
  vagrant_deb_filename = "vagrant_1.7.1_x86_64.deb"
  remote_file "/tmp/#{vagrant_deb_filename}" do
    source "https://dl.bintray.com/mitchellh/vagrant/#{vagrant_deb_filename}"
    mode 0644
  end
  dpkg_package "vagrant" do
    source "/tmp/#{vagrant_deb_filename}"
    action :install
  end
  file "/tmp/#{vagrant_deb_filename}" do
    action :delete
  end

  # install virtualbox
  virtualbox_deb_filename = "virtualbox.deb"
  remote_file "/tmp/#{virtualbox_deb_filename}" do
    source "http://download.virtualbox.org/virtualbox/4.3.20/virtualbox-4.3_4.3.20-96996~Ubuntu~raring_amd64.deb"
    mode 0644
  end
  dpkg_package "virtualbox" do
    source "/tmp/#{virtualbox_deb_filename}"
    action :install
  end
  file "/tmp/#{virtualbox_deb_filename}" do
    action :delete
  end

# install centos
when 'centos'
  # install vagrant
  vagrant_rpm_filename = "vagrant_1.7.1_x86_64.rpm"
  remote_file "/tmp/#{vagrant_rpm_filename}" do
    source "https://dl.bintray.com/mitchellh/vagrant/#{vagrant_rpm_filename}"
    mode 0644
  end
  rpm_package "vagrant" do
    action :install
    source "/tmp/#{vagrant_rpm_filename}"
  end
  file "/tmp/#{vagrant_rpm_filename}" do
    action :delete
  end

  # install virtualbox
  virtualbox_rpm_filename = "virtualbox.rpm"
  remote_file "/tmp/#{virtualbox_rpm_filename}" do
    source "http://download.virtualbox.org/virtualbox/4.3.20/VirtualBox-4.3-4.3.20_96996_el7-1.x86_64.rpm"
    mode 0644
  end
  rpm_package "virtualbox" do
    action :install
    source "/tmp/#{virtualbox_rpm_filename}"
  end
  file "/tmp/#{virtualbox_rpm_filename}" do
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
