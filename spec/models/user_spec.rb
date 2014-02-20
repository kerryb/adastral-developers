require "active_record_spec_helper"
require "models/user"

describe User do
  describe ".create_or_update_with_omniauth_hash" do
    let(:auth_hash) {
      {
        provider: "owa",
        uid: "42",
        info: {
          name: "Fred Bloggs",
          email: "fred.bloggs@example.com",
          first_name: "Fred",
          last_name: "Bloggs",
        },
      }
    }

    context "for a new user" do
      it "creates a user record" do
        User.create_or_update_with_omniauth_hash auth_hash
        expect(User.last.attributes).to include(
          "provider" => "owa",
          "uid" => "42",
          "name" => "Fred Bloggs",
          "email" => "fred.bloggs@example.com",
          "first_name" => "Fred",
          "last_name" => "Bloggs",
        )
      end
    end

    context "for an existing user" do
      let!(:user) { FactoryGirl.create :user, provider: "owa", uid: "42" }

      it "updates the user record" do
        User.create_or_update_with_omniauth_hash auth_hash
        expect(User.find(user.id).attributes).to include(
          "provider" => "owa",
          "uid" => "42",
          "name" => "Fred Bloggs",
          "email" => "fred.bloggs@example.com",
          "first_name" => "Fred",
          "last_name" => "Bloggs",
        )
      end
    end

    it "returns the user" do
      expect(User.create_or_update_with_omniauth_hash auth_hash).to eq User.last
    end
  end
end
