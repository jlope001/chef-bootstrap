# configure docker
case node['platform']
when 'ubuntu'
  include_recipe "docker"

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
service "docker" do
  action :stop
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
