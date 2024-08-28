
##
## ::: Summaries
##

desc 'Create a git archive at `$DATA_DIR/git`'
task :archive do
  system("git archive --format=tar HEAD | gzip > #{ENV['DATA_DIR']}/git/#{File.basename Dir.pwd}.tar.gz")
end

desc "Show diff for the last :n commits — `rake 'last[n]'`"
task :last, [:n] do |task, args|
  system("git diff HEAD~#{args[:n] or 1}..HEAD")
end

