class pki {
  
  $host = $::trusted["certname"];
  file { '/etc/ssl/private/host.key':
    ensure  => link,
    target  => "/etc/puppetlabs/puppet/ssl/private_keys/${host}.pem",
    require => [
      File['/etc/ssl/private'],
    ],
  }

  file { '/etc/ssl/private':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
  }

  file { '/etc/ssl/certs/host.crt':
    ensure => link,
    target => "/etc/puppetlabs/puppet/ssl/certs/${host}.pem",
  }

  file { '/etc/ssl/certs/host-ca.crt':
    ensure => link,
    target => '/etc/puppetlabs/puppet/ssl/certs/ca.pem',
  }
}
