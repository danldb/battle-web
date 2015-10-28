require "spec_helper"
require "web_helpers"

feature "Entering players" do
  scenario "players enter their names" do
    enter_names

    expect(page).to have_content('John')
    expect(page).to have_content('Jane')
  end
end
