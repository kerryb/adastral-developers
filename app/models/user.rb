class User < ActiveRecord::Base
  validates :provider, presence: true
  validates :uid, presence: true
  validates :name, presence: true
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.create_or_update_with_omniauth_hash auth_hash
    info = auth_hash[:info]
    user = find_or_initialize_by provider: auth_hash[:provider], uid: auth_hash[:uid]
    user.update_attributes(name: info[:name],
                           email: info[:email],
                           first_name: info[:first_name],
                           last_name: info[:last_name])
    user
  end
end
