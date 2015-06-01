include_recipe "golang::default"

execute "install go imports" do
  command "go get code.google.com/p/go.tools/cmd/goimports"
  action :run
  user    node[:bootstrap][:user]
  group   node[:bootstrap][:user]
end

link "/usr/local/bin/goimports" do
  to "#{node['go']['gopath']}/bin/goimports"
end
