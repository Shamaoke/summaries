require 'fileutils'

task :default => :merge

desc 'merge new project files with the existing ones'
task :merge do
  FileUtils.cp_r 'output/summaries/.', '.'
end

desc 'commit changes to VCS'
task :commit do
  system("git commit -am 'build #{Time.now.getutc.strftime '%Y-%m-%d %H:%M:%S'}'")
end

