require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new do |t|
    t.test_files = FileList["spec/spec_helper", "spec/**/*_spec.rb"]
    t.verbose = true
end

task :default => :test
