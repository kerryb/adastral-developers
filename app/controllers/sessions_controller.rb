class SessionsController < ApplicationController
  def new
  end

  def create
    session[:user] = User.create_or_update_with_omniauth_hash request.env["omniauth.auth"]
    redirect_to :root
  end

  def failure
    message = params.fetch(:message, "").humanize.downcase
    redirect_to :login, alert: "Failed to log in (#{message})"
  end

  def destroy
    session.delete :user
    redirect_to :root
  end
end
