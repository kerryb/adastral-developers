class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def require_login
    unless view_context.logged_in?
      flash[:notice] = "Please log in to see that page"
      flash[:protected_path] = request.path
      redirect_to(:login)
    end
  end
end
