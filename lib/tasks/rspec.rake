begin
  require "rspec/core/rake_task"
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
  desc "spec rake task not available (rspec not installed)"
  task :spec do
    abort "RSpec rake task is not available. Be sure to install the rspec gem or plugin"
  end
end
