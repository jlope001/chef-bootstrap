name             'bootstrap'
maintainer       'Jose Lopez'
maintainer_email 'jlope001@gmail.com'
license          'All rights reserved'
description      'Install and configure host machine'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1'

recipe            "bootstrap::vagrant", "Install vagrant for VM management"
recipe            "bootstrap::docker", "Install docker focker lxc"
recipe            "bootstrap::zsh", "Setup install zsh terminal"

depends "apt"
depends "docker"
