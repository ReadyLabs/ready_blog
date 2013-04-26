require 'spec_helper'

feature 'User creates Post' do
  scenario 'success' do
    visit root_path
    sign_in_as(FactoryGirl.create(:user))
    click_on t('posts.new')
    fill_in_new_post_form
    submit_form
    click_on 'My Posts'
    page.should have_content('My First Post')
  end

  def fill_in_new_post_form
    fill_in 'Title', with: 'My First Post'
    fill_in 'Body', with: 'Lorem Ipsum so on and so forth'
  end

  def sign_in_as(user)
    click_on t('visitors.sessions.new')
    fill_in_sign_in_form(user)
    submit_form
  end
end
