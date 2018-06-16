require 'rails_helper'

feature "can like post" do
  scenario "user can like post and see number of likes" do
    sign_up_and_sign_in
    create_a_post
    click_link 'Like'
    expect(page).to have_text '1'
  end
end
