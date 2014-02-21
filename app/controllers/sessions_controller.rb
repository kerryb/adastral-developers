class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.create_or_update_with_omniauth_hash request.env["omniauth.auth"]
    session[:user_id] = user.id
    redirect_to :root
  end

  def failure
    message = params.fetch(:message, "").humanize.downcase
    redirect_to :login, alert: "Failed to log in (#{message})"
  end

  def destroy
    session.delete :user_id
    redirect_to :root
  end
end
