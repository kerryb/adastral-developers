require "rails_spec_helper"

describe ApplicationHelper do
  describe "#current_user" do
    it "returns the user in the session" do
      user = FactoryGirl.build :user
      session[:user] = user
      expect(helper.current_user).to eq user
    end
  end
  describe "#logged_in?" do
    context "when there is no user in the session" do
      it "is false" do
        expect(helper.logged_in?).to be_false
      end
    end

    context "when there is a user in the session" do
      before { session[:user] = FactoryGirl.build :user }

      it "is true" do
        expect(helper.logged_in?).to be_true
      end
    end
  end
end
