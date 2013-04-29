POST_TITLE = 'My First Post'
POST_BODY = 'Lorem Ipsum post body stuff'

FactoryGirl.define do
  factory :post do
    title POST_TITLE
    body POST_BODY
    user
  end
end