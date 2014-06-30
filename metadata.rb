name             'bootstrap'
maintainer       'Jose Lopez'
maintainer_email 'jlope001@gmail.com'
license          'All rights reserved'
description      'Install and configure host machine'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1'

recipe            "boostrap", "All current development environments"
recipe            "development::base", "Install base system components"
recipe            "development::bootstrap", "Bootstrap the vm with base cookbooks"
recipe            "development::lamp", "Installs LAMP stack"
recipe            "development::site", "Installs sendgrid symfony site"
recipe            "development::cam", "Installs cam app to site"

depends "apt"
