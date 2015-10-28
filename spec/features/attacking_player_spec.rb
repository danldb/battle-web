require "spec_helper"
require "web_helpers"

feature "Attacking" do
  scenario "Player 1 attacks Player 2 and gets a confirmation" do
    enter_names(player1: "John", player2: "Jane")

    within("div.player1") do
      click_link "Attack"
    end

    expect(current_path).to have_content("/attack")
    expect(page).to have_content("John attacked Jane!")
  end
end
