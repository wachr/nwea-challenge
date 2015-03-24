class nwea-tech-quiz (
    $content_root = '/usr/share/nginx/site',
    $git_repo     = 'https://github.com/nwea-techops/tech_quiz.git',
  ) {

  class { 'nwea-tech-quiz::get-content' :
    git_repo  => $git_repo,
    directory => $content_root,
  }

  class { 'nwea-tech-quiz::serve-content' :
    content => $content_root,
  }
}
