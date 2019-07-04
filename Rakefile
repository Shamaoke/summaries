require 'fileutils'

task :default => :merge

desc 'merge new project files with the existing ones'
task :merge do
  FileUtils.cp_r 'output/summaries/.', '.'
end
