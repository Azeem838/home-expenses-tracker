FactoryBot.define do
  factory :user do
    username { 'test' }
    email { 'test@example.com' }
    password { 'password123' }
  end
end
