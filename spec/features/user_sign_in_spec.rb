require 'spec_helper'

feature 'Visitor signs in' do
  scenario 'success' do
    visit root_path 
    click_on t('visitors.sessions.new')
    fill_in_sign_in_form
    submit_form

    should_see_message_visitor_signed_in
  end

  def should_see_message_visitor_signed_in
    page.should have_content(t('devise.sessions.signed_in'))
  end
end
