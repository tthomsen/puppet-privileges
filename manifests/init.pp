# == Class: privileges
#
# Full description of class privileges here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'privileges':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
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
  }
  
  ::sudo::conf { 'admins':
    ensure  => present,
    content => '%admin ALL=(ALL) ALL',
  }
  
  sudo::conf { 'wheel':
    ensure  => present,
    content => '%wheel ALL=(ALL) ALL',
  }
  
  sudo::conf { 'vagrant':
    ensure  => present,
    content => '%vagrant ALL=(ALL) NOPASSWD: ALL',
  }
}
