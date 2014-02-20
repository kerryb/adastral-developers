require "rails_spec_helper"

describe SessionsController do
  describe "#create" do
    let(:user) { double :user }

    before do
      User.stub create_or_update_with_omniauth_hash: user
    end

    it "creates or updates a user record" do
      auth_hash = {"foo" => "bar"}
      request.env["omniauth.auth"] = auth_hash
      post :create
      expect(User).to have_received(:create_or_update_with_omniauth_hash).with auth_hash
    end

    it "puts the user in the session" do
      post :create
      expect(session[:user]).to eq user
    end

    it "redirects to the home page" do
      post :create
      expect(response).to redirect_to :root
    end
  end
end
