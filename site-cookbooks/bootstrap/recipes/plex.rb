apt_repository 'plex' do
  uri          'http://ppa.launchpad.net/plexapp/plexht/ubuntu'
  distribution  node[:bootstrap][:distribution]
  components   ['main']
  keyserver    'keyserver.ubuntu.com'
  key          'EB7DFFFB'
end
package "plexmediaserver" do
  action :install
end

# add newly created plux user to user group
group node[:bootstrap] do
  action :modify
  members "plex"
  append true
end
