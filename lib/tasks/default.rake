Rake::Task[:default].clear

desc "Run all the tests"
task :default => %i[clean db:migrate db:test:prepare spec cucumber:all]
