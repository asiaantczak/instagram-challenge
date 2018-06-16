require 'rails_helper'

feature 'posting picture' do
  scenario 'can create a post with a picture' do
    sign_up_and_sign_in
    create_a_post
    expect(page).to have_content('me and my sweet kids')
    expect(page).to have_css("img[src*='mum.jpeg']")
  end
end
