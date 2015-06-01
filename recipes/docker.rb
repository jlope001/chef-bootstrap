# configure docker
case node['platform']
when 'ubuntu'
  execute "install docker via installation script" do
    command "wget -qO- https://get.docker.com/ | sh"
    action :run
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
