module ApplicationHelper
  def current_user
    session[:user]
  end

  def logged_in?
    session[:user]
  end
end
