FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'Test1234'
    password_confirmation 'Test1234'

    factory :user_with_posts do
      ignore do
        posts_count 2
      end
      after(:create) do |user, evaluator|
        FactoryGirl.create_list(:post, evaluator.posts_count, user: user)
      end
    end
  end
end
