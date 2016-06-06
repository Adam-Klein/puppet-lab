# -*- mode: ruby -*-
# vi: set ft=ruby :
#

abort "Please install oscar by running 'vagrant plugin install oscar'" unless defined? Oscar

Vagrant.configure('2', &Oscar.run(File.expand_path('../config', __FILE__))) if defined? Oscar
