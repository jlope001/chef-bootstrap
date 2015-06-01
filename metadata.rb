name             'bootstrap'
maintainer       'Jose Lopez'
maintainer_email 'jlope001@gmail.com'
license          'All rights reserved'
description      'Install and configure host machine'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.30'

recipe            "bootstrap::default", "default bootstrap option"
recipe            "bootstrap::plex", "steam movies via plex media server"
recipe            "bootstrap::vagrant", "vm manager"
recipe            "bootstrap::owncloud", "personal cloud storage"
recipe            "bootstrap::zsh", "terminal setup"
recipe            "bootstrap::docker", "docker system"
recipe            "bootstrap::epel", "additional repositories"
recipe            "bootstrap::golang", "setup golang on sytem"

depends "apt"
depends "docker"
depends "yum"
depends "golang"

