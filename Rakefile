require "bundler/gem_tasks"
require "rubocop/rake_task"
require 'rake/testtask'

RuboCop::RakeTask.new

Rake::TestTask.new do |t|
  t.pattern = "spec/**/*_spec.rb"
end
