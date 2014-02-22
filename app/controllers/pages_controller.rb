class PagesController < ApplicationController
  def show
    page = params[:page]
    render action: page
  end
end
