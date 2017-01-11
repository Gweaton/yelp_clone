require 'rails_helper'

feature 'reviewing' do

  before do
    sign_up
    user_creates_restaurant
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'
  end

  scenario 'allows users to leave a review using a form' do
    click_link 'KFC'
    expect(page).to have_content('so so')
  end

  scenario 'users cannot leave more than one review per restaurant' do
    click_link 'Review KFC'
    fill_in "Thoughts", with: "Another review!"
    select '1', from: 'Rating'
    click_button 'Leave Review'
    expect(page).to have_content("You have already written a review for this restaurant.")
  end
end
