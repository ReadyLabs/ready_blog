require 'spec_helper'

feature 'Visitor signs in' do
  scenario 'success' do
    visit root_path
    sign_in_as(FactoryGirl.create(:user))

    should_see_message_visitor_signed_in
    should_not_see_sign_in_form
  end

  def should_see_message_visitor_signed_in
    page.should have_content(t('devise.sessions.signed_in'))
  end

  def should_not_see_sign_in_form
    page.should_not have_css('#sign_in_form')
  end
end
