desc "Run all the tests"
task :default => %i[db:migrate db:test:prepare spec]
