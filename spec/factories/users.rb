
# a factgory to test the user creation logic
FactoryBot.define do
  factory :user do
    email { "user@example.com" }
    password { "password123" }
    password_confirmation { "password123" }
  end
end
