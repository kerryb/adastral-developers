require "rails_spec_helper"

describe ApplicationHelper do
  describe "#current_user" do
    let(:user) { double :user }

    before do
      User.stub(:find).with(123) { user }
      session[:user_id] = 123
    end

    it "returns the user whose ID is in the session" do
      expect(helper.current_user).to eq user
    end

    it "memoises the user" do
      2.times { helper.current_user }
      expect(User).to have_received(:find).once
    end
  end

  describe "#logged_in?" do
    context "when there is no user ID in the session" do
      it "is false" do
        expect(helper.logged_in?).to be_false
      end
    end

    context "when there is a user ID in the session" do
      before { session[:user_id] = 123 }

      it "is true" do
        expect(helper.logged_in?).to be_true
      end
    end
  end

  describe "#omniauth_callback" do
    it "returns the appropriate callback path for the default strategy" do
      Rails.configuration.default_omniauth_strategy = "foo"
      expect(helper.omniauth_callback).to eq "/auth/foo/callback" 
    end
  end

  describe "#avatar_for" do
    let(:user) { build :fred_bloggs }

    it "returns a gravatar image link" do
      expect(helper.avatar_for user, size: 100).to eq(
        %{<img alt="fred.bloggs@example.com" src="http://www.gravatar.com/avatar/c96ed9c232a9be4460f66ef650a82387?s=100&d=retro" />}
      )
    end

    it "defaults the size to 45" do
      expect(helper.avatar_for user).to match(/\?s=45/)
    end
  end
end
