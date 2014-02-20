module ApplicationHelper
  def current_user
    session[:user]
  end

  def logged_in?
    session[:user]
  end

  def omniauth_callback
    "/auth/#{Rails.configuration.default_omniauth_strategy}/callback"
  end
end
