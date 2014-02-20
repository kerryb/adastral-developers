require "omniauth/strategies/dummy"

Rails.application.config.middleware.use OmniAuth::Builder do
  unless Rails.env.production?
    provider :dummy, :form => SessionsController.action(:new)
  end
end
