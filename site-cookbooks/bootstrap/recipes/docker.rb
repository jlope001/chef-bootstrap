apt_repository 'docker' do
  uri          'https://get.docker.io/ubuntu'
  distribution 'docker'
  components   ['main']
  key          '36A1D7869245C8950F966E92D8576A8BA88D21E9'
end

package "lxc-docker" do
  action :install
end
