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

  def avatar_for user, size: 45
    image_tag "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest user.email}?s=#{size}&d=retro".html_safe, alt: user.email
  end
end
