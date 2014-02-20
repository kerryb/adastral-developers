require "omniauth/strategies/owa"

Rails.application.config.middleware.use OmniAuth::Builder do
  unless Rails.env.production?
    provider :owa, :form => SessionsController.action(:new)
  end
end
