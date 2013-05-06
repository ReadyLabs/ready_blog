require 'spec_helper'

feature 'Visitor browses blogs by user' do
  scenario 'success' do
    user_a = create(:user_with_posts, posts_count: 3)
    
    visit root_path
    click_on t('users.index')
    page.should have_css('.user')

    click_on user_a.full_name
    
    user_a.posts.each do |post|
      page.should have_content(post.title)
    end
  end
end
