require 'rails_helper'

feature 'sign up' do
  scenario 'user has to register before posting pictures' do
    visit '/'
    click_link 'New Post'
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end
