FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "email-#{n}@gmail.com" }
    password '12345678'
  end

  factory :observation do
    temp 1
    pressure 2
    humidity 3
    created_at { Time.current }
  end

  factory :access_token, class: Doorkeeper::AccessToken
end
