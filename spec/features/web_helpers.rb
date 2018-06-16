def sign_up_and_sign_in
  visit "/"
  click_link "Register"
  fill_in "Name", with: "Emma"
  fill_in "Email", with: "emma@hotmail.com"
  fill_in('Password', with: 'emma11', match: :first)
  fill_in('Password confirmation', with: 'emma11', match: :prefer_exact)
  click_button "Sign up"
end

def sign_up_and_sign_in_other_user
  visit "/"
  click_link "Register"
  fill_in "Name", with: "Lucy"
  fill_in "Email", with: "lucy@hotmail.com"
  fill_in('Password', with: 'lucy11', match: :first)
  fill_in('Password confirmation', with: 'lucy11', match: :prefer_exact)
  click_button "Sign up"
end

def sign_in
  visit "/"
  click_link "Login"
  fill_in "Email", with: "emma@hotmail.com"
  fill_in('Password', with: 'emma11', match: :first)
  click_button 'Log in'
end

def create_a_post
  click_link 'New Post'
  attach_file('post[image]', "spec/files/images/mum.jpeg")
  fill_in 'post[description]', with: 'me and my sweet kids'
  click_button 'submit'
end
