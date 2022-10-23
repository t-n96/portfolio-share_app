FactoryBot.define do
  factory :user do
    name { "test" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "testuser" }
    password_confirmation { "testuser" }
  end
end
