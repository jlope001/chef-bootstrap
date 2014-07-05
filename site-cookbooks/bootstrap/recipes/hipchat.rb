apt_repository 'hipchat' do
  uri          'http://downloads.hipchat.com/linux/apt'
  distribution 'stable'
  components   ['main']
  key          'https://www.hipchat.com/keys/hipchat-linux.key'
end

package "hipchat" do
  action :install
end
