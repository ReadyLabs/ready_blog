def submit_form
  find('input[type="submit"]').click
end

def fill_in_sign_in_form(user = nil)
  user ||= FactoryGirl.create(:user)
  fill_in 'user_email', with: user.email
  fill_in 'user_password', with: user.password
end

