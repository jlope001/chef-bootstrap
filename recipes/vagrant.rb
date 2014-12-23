case node['platform']

# install ubuntu vagrant
when 'ubuntu'
  # install vagrant
  vagrant_deb_filename = "vagrant_1.7.1_x86_64.deb"
  remote_file "/tmp/#{vagrant_deb_filename}" do
    source "https://dl.bintray.com/mitchellh/vagrant/#{vagrant_deb_filename}"
    mode 0644
    checksum "6615b95fcd8044e2f5e1849ec1004df5e05e390812558ec2c4b3dcec541b92da"
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
  vagrant_rpm_filename = "vagrant_1.7.1_x86_64.rpm"
  remote_file "/tmp/#{vagrant_rpm_filename}" do
    source "https://dl.bintray.com/mitchellh/vagrant/#{vagrant_rpm_filename}"
    mode 0644
    checksum "b66be4b8f7921f59b00c186344c8501f97a26e172e94c3add7298b5147bcab27"
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
