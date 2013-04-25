require 'spec_helper'

feature 'Visitor creates UserRegistration' do
  scenario 'success' do
    visit root_path
    click_on t('visitors.user_registrations.new')
    fill_in_sign_up_form
    submit_form

    should_see_message_visitor_created_user
  end

  def show_errors_in_terminal
    if find('#session_dump')
      error_class = find('h1').text
      error_message = find('h1 + pre').text
      full_trace = find('#Full-Trace pre').text
      
      puts "
        #{error_class}: #{error_message}
        ------- full trace:
        #{full_trace}
      "
    end
  end

  def t(key, *options)
    I18n.t(key, *options)
  end

  def fill_in_sign_up_form
    user = FactoryGirl.build(:user)
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
  end

  def submit_form
    find('input[type="submit"]').click
  end

  def should_see_message_visitor_created_user
    page.should have_content(
      t('devise.registrations.signed_up')
    )
  end
end
