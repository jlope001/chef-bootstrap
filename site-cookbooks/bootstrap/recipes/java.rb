apt_repository 'java' do
  uri          'http://ppa.launchpad.net/webupd8team/java/ubuntu'
  distribution  node[:bootstrap][:distribution]
  components   ['main']
  keyserver    'keyserver.ubuntu.com'
  key          'EEA14886'
end

# show that you've read the license agreement
execute "java license agreement auto select true" do
  command "echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections"
  action :run
end
execute "java license agreement auto select true" do
  command "echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections"
  action :run
end

package "oracle-java7-installer" do
  action :install
end
