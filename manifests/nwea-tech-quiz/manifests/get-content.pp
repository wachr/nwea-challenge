class nwea-tech-quiz::get-content ( $git_repo, $directory ) {

  package { "git":
    ensure => installed
  }

  exec { "clone-content":
    require => Package["git"],
    command => "/usr/bin/git clone $git_repo $directory",
    creates => $content,
  }

}
