require "rails_spec_helper"

describe PagesController do
  before { session[:user_id] = 123 }

  describe "#show" do
    it "renders the specified page" do
      get :show, page: "home"
      expect(response).to render_template :home
    end
  end
end
