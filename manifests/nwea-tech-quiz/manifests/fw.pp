class nwea-tech-quiz::fw {
  stage { 'fw_pre': before => Stage['main']; }
  stage { 'fw_post': require => Stage['main']; }

  class { 'firewall':
    stage => 'fw_pre',
    ensure => 'running',
  }

  class { 'nwea-tech-quiz::pre-fw':
    stage => 'fw_pre',
  }

  class { 'nwea-tech-quiz::post-fw':
    stage => 'fw_post',
  }

  resources { "firewall":
    purge => true
  }

  # allow tcp traffic on port 8888
  firewall { '200 accept port 8888':
    proto => 'tcp',
    port  => '8888',
    action => 'accept',
  }

}

class nwea-tech-quiz::pre-fw {
  Firewall {
    require => undef,
  }

  # Default firewall rules
  firewall { '000 accept all icmp':
    proto => 'icmp',
    action => 'accept',
  }

  firewall { '001 accept all to lo interface':
    proto => 'all',
    iniface => 'lo',
    action => 'accept',
  }

  firewall { '002 accept related established rules':
    proto => 'all',
    state => ['RELATED', 'ESTABLISHED'],
    action => 'accept',
  }

  # Allow SSH
  firewall { '100 allow ssh access':
    port => '22',
    proto => 'tcp',
    action => 'accept',
  }

}

class nwea-tech-quiz::post-fw {

  firewall { "999 drop all other requests":
    action => "drop",
  }
}
