require 'spec_helper'

feature 'User publishes Post' do
  scenario 'success' do
    visit root_path
    user = FactoryGirl.create(:user_with_posts, posts_count: 4)
    sign_in_as(user)
    visit user_posts_path(user)
    first('.post_status').click_on t('posts.publish')
    first('.post_status').should have_content('This post is published.')
  end
end