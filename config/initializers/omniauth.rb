require "omniauth/strategies/dummy"

Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.test?
    provider :dummy, form: SessionsController.action(:new)
  else
    provider :owa, base_url: "https://webmail.bt.com", form: SessionsController.action(:new)
  end
end
