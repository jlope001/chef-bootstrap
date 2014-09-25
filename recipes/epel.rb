is_centos_6 = false
is_centos_7 = false

# configure all required EPEL repositories
case node['platform']
when 'centos'

  ruby_block "determine centOS version" do
      block do
        # tricky way to load this Chef::Mixin::ShellOut utilities
        Chef::Resource::RubyBlock.send(:include, Chef::Mixin::ShellOut)
        curl_command = "cat /etc/centos-release | grep 'release 6'"
        is_centos_6 = shell_out(curl_command)

        curl_command = "cat /etc/centos-release | grep 'release 7'"
        is_centos_7 = shell_out(curl_command)

      end
      action :create
  end

  # centOS 6
  if is_centos_6

    # EPEL
    yum_repository 'epel' do
      mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch'
      description 'Extra Packages for Enterprise Linux 6 - $basearch'
      enabled true
      gpgcheck true
      gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL'
    end

  # centOS 7
  elsif is_centos_7

    # EPEL
    yum_repository 'epel' do
      mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-7&arch=$basearch'
      description 'Extra Packages for Enterprise Linux 7 - $basearch'
      enabled true
      gpgcheck true
      gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL'
    end

    # docker
    remote_file "#{Chef::Config[:file_cache_path]}/goldmann-docker-io-epel-7.repo" do
        source "https://copr.fedoraproject.org/coprs/goldmann/docker-io/repo/epel-7/goldmann-docker-io-epel-7.repo"
        action :create
    end
    rpm_package "docker" do
        source "#{Chef::Config[:file_cache_path]}/goldmann-docker-io-epel-7.repo"
        action :install
    end
  end
end
