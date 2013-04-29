require 'spec_helper'

feature 'User browses posts' do
  scenario 'success' do
    visit root_path
    sign_in_as(FactoryGirl.create(:user_with_posts, posts_count: 5))
    click_on t('posts.browse')
    page.should have_css('.post_status', count: 5)
  end
end