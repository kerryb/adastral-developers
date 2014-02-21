require "rails_spec_helper"

describe SessionsController do
  describe "#create" do
    let(:user) { double :user, id: 123 }

    before do
      User.stub create_or_update_with_omniauth_hash: user
    end

    it "creates or updates a user record" do
      auth_hash = {"foo" => "bar"}
      request.env["omniauth.auth"] = auth_hash
      post :create
      expect(User).to have_received(:create_or_update_with_omniauth_hash).with auth_hash
    end

    it "puts the user ID in the session" do
      post :create
      expect(session[:user_id]).to eq 123
    end

    it "redirects to the home page" do
      post :create
      expect(response).to redirect_to :root
    end
  end

  describe "#failure" do
    it "puts a message in the flash" do
      post :failure, message: "invalid_credentials"
      expect(flash[:alert]).to eq "Failed to log in (invalid credentials)"
    end

    it "redirects to the login page" do
      post :failure
      expect(response).to redirect_to :login
    end
  end

  describe "#destroy" do
    before { session[:user_id] = 123 }

    it "removes the user ID from the session" do
      get :destroy
      expect(session).not_to have_key(:user_id)
    end

    it "redirects to the home page" do
      get :destroy
      expect(response).to redirect_to :root
    end
  end
end
