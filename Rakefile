
##
## ::: Summaries
##

desc "Commit changes to VCS and create a git archive at #{ENV['DATA_DIR']}/git"
task :save => [ :commit, :archive ]

desc 'Commit changes to VCS'
task :commit do
  system("git add . && git commit --message '#{Time.now.getutc.strftime '%Y-%m-%d %H:%M:%S'}'")
end

desc "Create a git archive at #{ENV['DATA_DIR']}/git"
task :archive do
  system("git archive --format=tar HEAD | gzip > #{ENV['DATA_DIR']}/git/#{File.basename Dir.pwd}.tar.gz")
end

desc "Show diff for the last N commits — `rake 'last[n]'`"
task :last, [:n] do |task, args|
  system("git diff HEAD~#{args[:n] or 1}..HEAD")
end

