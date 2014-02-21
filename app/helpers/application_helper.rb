module ApplicationHelper
  def current_user
    @current_user ||= User.find session[:user_id]
  end

  def logged_in?
    session.has_key? :user_id
  end

  def omniauth_callback
    "/auth/#{Rails.configuration.default_omniauth_strategy}/callback"
  end
end
