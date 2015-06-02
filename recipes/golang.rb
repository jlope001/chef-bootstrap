include_recipe "golang::default"

execute "install go imports" do
  command "#{node['go']['install_dir']}/go/bin/go get code.google.com/p/go.tools/cmd/goimports"
  action :run
  environment ({'GOPATH' => node['go']['gopath']})
end

link "/usr/local/bin/goimports" do
  to "#{node['go']['gopath']}/bin/goimports"
end


execute 'add golang to PATH' do
  command "echo export PATH=$PATH:#{node['go']['install_dir']}/go/bin >> $HOME/.bashrc"
  not_if "cat ~/.bashrc | grep '#{node['go']['install_dir']}'/go"
end
