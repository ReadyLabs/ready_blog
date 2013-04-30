require 'spec_helper'

feature 'User reads a post' do
  scenario 'success' do
    visit root_path
    sign_in_as(FactoryGirl.create(:user_with_posts, posts_count: 5))
    click_on t('posts.browse')
    first('.post').click_on t('posts.view')
    page.should have_css('.post_content')
  end
end