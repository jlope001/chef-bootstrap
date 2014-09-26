is_centos_6 = false
is_centos_7 = false

# configure all required EPEL repositories
case node['platform']
when 'centos'
  find = Mixlib::ShellOut.new("cat /etc/centos-release | grep 'release 6'")
  find.run_command
  is_centos_6 = find.stdout

  find = Mixlib::ShellOut.new("cat /etc/centos-release | grep 'release 7'")
  find.run_command
  is_centos_7 = find.stdout

  # centOS 6
  if ! is_centos_6.empty?
    execute "centos 6 detected" do
      command "echo 'hello 6'"
      action :run
    end

    # EPEL
    yum_repository 'epel' do
      mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch'
      description 'Extra Packages for Enterprise Linux 6 - $basearch'
      enabled true
      gpgcheck true
      gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL'
    end

  # centOS 7
  elsif ! is_centos_7.empty?
    execute "centos7 detected" do
      command "echo 'hello 7'"
      action :run
    end

    # EPEL
    yum_repository 'epel' do
      mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-7&arch=$basearch'
      description 'Extra Packages for Enterprise Linux 7 - $basearch'
      enabled true
      gpgcheck true
      gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL'
    end
    remote_file "/etc/yum.repos.d/docker.repo" do
        source "https://copr.fedoraproject.org/coprs/goldmann/docker-io/repo/epel-7/goldmann-docker-io-epel-7.repo"
        action :create
    end
  end
end
