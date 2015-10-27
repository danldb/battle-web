require "spec_helper"

feature "Entering players" do
  scenario "players enter their names" do
    visit "/"

    fill_in('Player 1 name', :with => 'John')
    fill_in('Player 2 name', :with => 'Jane')

    click_button('Submit')

    expect(page).to have_content('John')
    expect(page).to have_content('Jane')
  end
end
