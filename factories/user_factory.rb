FactoryGirl.define do
  sequence :uid do |n|
    800000000 + n
  end
  sequence :first_name do |n|
    %w[Fred Alice Dave Lucy Bob Kate][n]
  end

  sequence :last_name do |n|
    %w[Bloggs Smith Jones Davis Trubshaw][n]
  end

  factory :user do
    provider "owa"
    uid 
    first_name
    last_name
    name { "#{first_name} #{last_name}" }
    email { "#{first_name}.#{last_name}@example.com".downcase }
  end
end
