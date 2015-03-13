# manifests/nwea-tech-quiz.pp
# author: Ray Wach
# date: 2015-03-12

package { "epel-release":
  ensure => installed
}

package { "nginx":
  require => Package["epel-release"],
  ensure => installed
}

package { "git":
  ensure => installed
}

service { "nginx":
  ensure => running,
  enable => true
}

$content = "/usr/share/nginx/site"

$gitrepo = "https://github.com/nwea-techops/tech_quiz.git"

exec { "clone-content":
  require => Package["git"],
  command => "/usr/bin/git clone $gitrepo $content",
  creates => $content,
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
