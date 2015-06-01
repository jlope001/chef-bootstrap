apt_repository 'hipchat' do
  uri          'http://downloads.hipchat.com/linux/apt'
  distribution 'stable'
  components   ['main']
  key          'https://www.hipchat.com/keys/hipchat-linux.key'
end

package "hipchat" do
  action :install
end

[
  'wget http://raelcunha.com/ubuntu-mono-dark/hipchat.svg -O /usr/share/icons/ubuntu-mono-dark/apps/22/hipchat.svg',
  'wget http://raelcunha.com/ubuntu-mono-light/hipchat.svg -O /usr/share/icons/ubuntu-mono-light/apps/22/hipchat.svg',
  'wget http://raelcunha.com/ubuntu-mono-dark/hipchat-attention.svg -O /usr/share/icons/ubuntu-mono-dark/apps/22/hipchat-attention.svg',
  'wget http://raelcunha.com/ubuntu-mono-dark/48.svg -O /usr/share/icons/ubuntu-mono-dark/apps/48/hipchat.svg',
  'ln -sf /usr/share/icons/ubuntu-mono-dark/apps/22/hipchat-attention.svg /usr/share/icons/ubuntu-mono-light/apps/22/hipchat-attention.svg',
  'ln -sf /usr/share/icons/ubuntu-mono-dark/apps/48/hipchat.svg /usr/share/icons/ubuntu-mono-light/apps/48/hipchat.sv',
  'gtk-update-icon-cache --ignore-theme-index -f /usr/share/icons/ubuntu-mono-dark',
  'gtk-update-icon-cache --ignore-theme-index -f /usr/share/icons/ubuntu-mono-light',
].each do |command_to_run|
  execute "update hipchat icons to be monochrome" do
    command command_to_run
    action :run
  end
end
