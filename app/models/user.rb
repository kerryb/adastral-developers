class User < ActiveRecord::Base
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
