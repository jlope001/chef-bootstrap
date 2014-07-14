name             'bootstrap'
maintainer       'Jose Lopez'
maintainer_email 'jlope001@gmail.com'
license          'All rights reserved'
description      'Install and configure host machine'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

recipe            "bootstrap::default", "default bootstrap option"
recipe            "bootstrap::plex", "include plex media server"
recipe            "bootstrap::docker", "install docker system"

depends "apt"
depends "docker"
