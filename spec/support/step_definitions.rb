def submit_form
  find('input[type="submit"]').click
end

def fill_in_sign_in_form(user = nil)
  user ||= FactoryGirl.create(:user)
  first('#sign_in_form').fill_in 'user_email', with: user.email
  first('#sign_in_form').fill_in 'user_password', with: user.password
end

def sign_in_as(user)
  fill_in_sign_in_form(user)
  first('#sign_in_form').find('input[type="submit"]').click
end