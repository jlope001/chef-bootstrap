#!/bin/bash

# install rvm and add source

\curl -L https://get.rvm.io | bash -s stable --ruby
source ~/.rvm/scripts/rvm
RVM_SOURCE=$(cat ~/.bashrc | grep '.rvm/scripts/rvm' | wc -l)
if [ $RVM_SOURCE -ge 1 ];
then
  echo '-- not adding rvm source entry'
else
  echo '-- adding rvm source entry'
  echo "source $HOME/.rvm/scripts/rvm" >> ~/.bashrc
fi
