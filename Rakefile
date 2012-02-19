#!/usr/bin/env rake

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = 'test/*_test.rb'
  t.verbose = true
end

task :default => :test

task :example do
  ruby "examples/run.rb"
end
