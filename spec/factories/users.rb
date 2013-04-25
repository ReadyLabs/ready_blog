FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'Test1234'
    password_confirmation 'Test1234'
  end
end
