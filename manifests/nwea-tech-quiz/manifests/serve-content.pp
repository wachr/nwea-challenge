class nwea-tech-quiz::serve-content ( $content ) {

  package { "epel-release":
    ensure => installed
  }

  package { "nginx":
    require => Package["epel-release"],
    ensure => installed
  }

  file { "/etc/nginx/nginx.conf":
    ensure => present,
    require => Exec["clone-content"],
    notify => Service["nginx"],
    content =>
      "
include nginx.conf.default;
http {
    index index.html;

    server {
        listen 8888 default_server;
        root $content;
    }
}"
  }

  service { "nginx":
    ensure => running,
    enable => true
  }

}
