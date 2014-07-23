include_recipe "docker"

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
