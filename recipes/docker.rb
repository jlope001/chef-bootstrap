%w{apt-transport-https ca-certificates}.each do |pkg|
  package pkg do
    action :install
  end
end

apt_repository 'docker' do
  uri          'https://apt.dockerproject.org/repo'
  distribution  'ubuntu-xenial'
  components   ['main']
  keyserver    'hkp://p80.pool.sks-keyservers.net'
  key          '58118E89F3A912897C070ADBF76221572C52609D'
end
package "docker-engine" do
 action :install
end

# create and add USER into docker group so we dont require sudo all the time
group "docker" do
  action :create
end
group "docker" do
  action :modify
  members node[:bootstrap][:user]
  append true
end

service "docker" do
  action :restart
end

execute "install docker via installation script" do
  command "curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
  action :run
end

file "/usr/local/bin/docker-compose" do
  mode "755"
end

