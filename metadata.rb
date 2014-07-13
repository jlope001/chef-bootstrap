name             'bootstrap'
maintainer       'Jose Lopez'
maintainer_email 'jlope001@gmail.com'
license          'All rights reserved'
description      'Install and configure host machine'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1'

recipe            "bootstrap::default", "Default bootstrap option"
recipe            "bootstrap::plex", "Include plex media server"
recipe            "bootstrap::docker", "Install docker system"

depends "apt"
depends "docker"
