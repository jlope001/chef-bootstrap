# apt_repository 'hipchat' do
#   uri          "https://atlassian.artifactoryonline.com/atlassian/hipchat-apt-client"
#   distribution "xenial"
#   components   ['main']
#   key          "https://atlassian.artifactoryonline.com/atlassian/api/gpg/key/public"
# end

# package "hipchat4" do
#   action :install
# end


# hipchat install while repo workaround is not working
deb_filename = "HipChat4-4.0.1633-Linux.deb"
remote_file "/tmp/#{deb_filename}" do
  source "https://atlassian.artifactoryonline.com/atlassian/hipchat-apt-client/pool/#{deb_filename}"
  mode 0644
end

dpkg_package "hipchat4" do
  source "/tmp/#{deb_filename}"
  action :install
end

file "/tmp/#{deb_filename}" do
  action :delete
end
