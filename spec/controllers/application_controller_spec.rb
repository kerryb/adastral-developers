require "rails_spec_helper"

describe ApplicationController do
  controller do
    before_filter :require_login

    def index
      render nothing: true
    end
  end

  describe "#require_login" do
    context "when logged in" do
      before { session[:user_id] = 123 }

      it "allows the action to continue" do
        get :index
        expect(response).to be_success
      end
    end

    context "when not logged in" do
      it "redirects to the login page" do
        get :index
        expect(response).to redirect_to :login
      end

      it "puts a message in the flash" do
        get :index
        expect(flash[:notice]).to eq "Please log in to see that page"
      end

      it "saves the requested path in the flash" do
        get :index
        expect(flash[:protected_path]).to eq "/anonymous"
      end
    end
  end
end
