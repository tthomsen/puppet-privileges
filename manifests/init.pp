# == Class: privileges
#
# A simple module to manage permissions.
#
# === Parameters
# No parameters just yet.
#
#
# === Examples
#
#  class { 'privileges': }
#
# === Authors
#
# Travis N. Thomsen <tthomsen@binaryvoid.com>
#
# === Copyright
#
# Copyright 2015 Travis N. Thomsen, unless otherwise noted.
#
class privileges {

  user { 'root':
    ensure   => present,
    shell    => '/bin/bash',
    uid      => '0',
  }
  
  user { 'tthomsen':
    ensure    => present,
    shell     => '/bin/bash',
    gid       => ['wheel'],
    managehome => true, 
    home       => '/home/tthomsen',
    password   => '$6$J6HgYJ4bzT52qyG/$2NpTsujTqLrqh4M6gRFj8fI6U76C5qs2vsj6jsK3PBEmD6MntHPh7JyemFRTO5Ms6SxnFs8E7mlGrUwe5FiIn/'
  }
  
  ::sudo::conf { 'admins':
    ensure  => present,
    content => '%admin ALL=(ALL) ALL',
  }
  
  sudo::conf { 'wheel':
    ensure  => present,
    content => '%wheel ALL=(ALL) ALL',
  }
 
  if $::boardproductname == 'VirtualBox' { 
    sudo::conf { 'vagrant':
      ensure  => present,
      content => '%vagrant ALL=(ALL) NOPASSWD: ALL',
    }
  }
}
