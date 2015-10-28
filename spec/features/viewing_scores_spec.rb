require "spec_helper"
require "web_helpers"

feature "Viewing scores" do
  scenario "player 1 sees Player 2's Hit Points" do
    enter_names

    within(:css, "div.player2") do
      expect(page).to have_content('0/60 HP')
    end
  end
end
