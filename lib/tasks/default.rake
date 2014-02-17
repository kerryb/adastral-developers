Rake.application.instance_variable_get("@tasks").delete "default"

desc "Run all the tests"
task :default => %i[db:migrate db:test:prepare spec cucumber:all]
