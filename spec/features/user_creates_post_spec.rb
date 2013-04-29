require 'spec_helper'

POST_TITLE = 'My First Post'

feature 'User creates Post' do
  scenario 'success' do
    visit root_path
    sign_in_as(FactoryGirl.create(:user))
    click_on t('posts.new')
    fill_in_new_post_form
    submit_form
    click_on 'My Posts'
    page.should have_content(POST_TITLE)
  end

  def fill_in_new_post_form
    fill_in 'Title', with: POST_TITLE
    fill_in 'Body', with: 'Lorem Ipsum so on and so forth'
  end
end
