require 'rails_helper'

feature 'comment' do
  scenario 'can add a comment to post' do
    sign_up_and_sign_in
    click_link 'New Post'
    attach_file('post[image]', "spec/files/images/mum.jpeg")
    fill_in 'post[description]', with: 'me and my sweet kids'
    click_button 'submit'
    fill_in 'comment[content]', with: 'What a lovely pic! Miss you both!'
    click_button 'Comment'
    expect(page).to have_content 'What a lovely pic! Miss you both!'
  end

  scenario 'display name of the user who added a comment' do
    sign_up_and_sign_in
    click_link 'New Post'
    attach_file('post[image]', "spec/files/images/mum.jpeg")
    fill_in 'post[description]', with: 'me and my sweet kids'
    click_button 'submit'
    click_link 'Logout'
    sign_up_and_sign_in_other_user
    fill_in 'comment[content]', with: 'What a lovely pic! Miss you both!'
    click_button 'Comment'
    click_link 'Logout'
    sign_in
    expect(page).to have_content 'Lucy'
  end
end
