class SessionsController < ApplicationController
  def new
  end

  def create
    session[:user] = User.create_or_update_with_omniauth_hash request.env["omniauth.auth"]
    redirect_to :root
  end
end
