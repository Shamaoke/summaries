
##
## ::: Summaries :::
##

desc 'Save changes to VCS'
task save: :commit

desc 'Commit changes to VCS'
task :commit do
  system("git add . && git commit --message '#{Time.now.getutc.strftime('%Y-%m-%d %H:%M:%S')}'")
end

desc "Show diff for the last N commits — `rake 'last[n]'`"
task :last, [:n] do |task, args|
  system("git diff HEAD~#{args[:n] or 1}..HEAD")
end

