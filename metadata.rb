name             'bootstrap'
maintainer       'Jose Lopez'
maintainer_email 'jlope001@gmail.com'
license          'All rights reserved'
description      'Install and configure host machine'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1'

recipe            "boostrap::default", "Default bootstrap option"

depends "apt"
