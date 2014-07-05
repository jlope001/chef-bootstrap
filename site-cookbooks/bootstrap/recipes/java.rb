apt_repository 'java' do
  uri          'http://ppa.launchpad.net/webupd8team/java/ubuntu'
  distribution  node[:bootstrap][:distribution]
  components   ['main']
  keyserver    'keyserver.ubuntu.com'
  key          'EEA14886'
end
package "oracle-java7-installer" do
  action :install
end
