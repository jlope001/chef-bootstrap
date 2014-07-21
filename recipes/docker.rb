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
  action :restart
end

