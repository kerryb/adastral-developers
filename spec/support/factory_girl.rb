require "factory_girl"
FactoryGirl.definition_file_paths = %w[factories]
FactoryGirl.find_definitions

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.before(:suite) do
    FactoryGirl.lint
  end
end
