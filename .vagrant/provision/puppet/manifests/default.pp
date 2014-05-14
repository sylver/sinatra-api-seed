node backend {
  group { 'vagrant':
    ensure => present,
  }
  file { 'postgis.src':
    ensure => present,
    path => '/etc/apt/sources.list.d/postgist.list',
    content => 'deb http://apt.postgresql.org/pub/repos/apt/ wheezy-pgdg main',
  } ->
  exec { 'postgis.key':
    path => ["/bin", "/usr/bin", "/usr/sbin"],
    command => "wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -",
    unless => "apt-key list | grep ACCC4CF8",
    require => File['postgis.src']
  } ->
  exec { "apt-update":
    command => "/usr/bin/apt-get update",
    require => Exec['postgis.key']
  } ->
  package { [
    'postgresql-9.3',
    'postgresql-9.3-postgis',
    'postgresql-contrib',
    'postgresql-client',
    'libpq-dev'
    ] :
    ensure => present,
    require => Exec['postgis.key']
  } ->
  exec { "create_postgis_extension":
    path => ["/bin", "/usr/bin", "/usr/sbin"],
    command => "psql -c \"CREATE EXTENSION postgis\"",
    user => "postgres",
    unless => "psql -tAc \"SELECT 1 FROM pg_extension WHERE extname='postgis';\" | grep 1",
    require => Package['postgresql-9.3', 'postgresql-9.3-postgis'],
  }
  package { ['bundle', 'foreman']:
    provider => gem,
    ensure => present,
  } ->
  exec { "initapp":
    path => ["/bin", "/usr/bin", "/usr/sbin"],
    cwd => "/vagrant",
    command => "bundle install",
    user => "vagrant",
    onlyif => "test -f /vagrant/Gemfile",
  }

  # Quick&Dirty way to create default postgres user & database
  # TODO: use puppet modules to manage postgres logic
  exec { "create_psql_user":
    path => ["/bin", "/usr/bin", "/usr/sbin"],
    command => "psql -c \"CREATE USER vagrant WITH NOCREATEDB NOCREATEUSER ENCRYPTED PASSWORD E'vagrant'\"",
    user => "postgres",
    unless => "psql -tAc \"SELECT 1 FROM pg_roles WHERE rolname='vagrant'\" | grep 1",
    require => Package['postgresql-9.3'],
  } ->
  exec { "create_psql_db":
    path => ["/bin", "/usr/bin", "/usr/sbin"],
    command => "psql -c \"CREATE DATABASE db WITH OWNER vagrant ENCODING 'UTF8' TEMPLATE template0\"",
    user => "postgres",
    unless => "psql -tAc \"SELECT 1 FROM pg_database WHERE datname='db'\" | grep 1",
    require => Package['postgresql-9.3'],
  }
}

