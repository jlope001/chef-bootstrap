# configure docker
case node['platform']

when 'ubuntu'

  # pre-requisites
  %w{apt-transport-https ca-certificates}.each do |pkg|
    package pkg do
      action :install
    end
  end

  apt_repository 'docker' do
    uri          'https://apt.dockerproject.org/repo'
    distribution  'ubuntu-wily'
    components   ['main']
    keyserver    'hkp://p80.pool.sks-keyservers.net'
    key          '58118E89F3A912897C070ADBF76221572C52609D'
  end
  package "docker-engine" do
   action :install
  end

when 'centos'

  # setup EPEL - which will correctly setup EPEL repositories
  include_recipe "bootstrap::epel"

  # install docker
  package "docker" do
    action :install
  end
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

case node['platform']
when 'centos'
  execute "remove the docker start library" do
    command "rm -rf /var/lib/docker"
    action :run
  end
end

service "docker" do
  action :restart
end

execute "install docker via installation script" do
  command "curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
  action :run
end

file "/usr/local/bin/docker-compose" do
  mode "755"
end

