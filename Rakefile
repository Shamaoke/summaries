desc 'create a git archive at ~/.data-upper/git'
task :archive do
  `git archive --format=tar HEAD | gzip > ~/.data-upper/git/summaries.tar.gz`
end
