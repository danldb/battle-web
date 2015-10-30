require "spec_helper"
require "web_helpers"

feature "Losing a game" do
  scenario "Players attack each other until Slowpoke loses" do
    enter_names(player1: "Piccachu", player2: "Slowpoke")

    2.times do
      attack(:player1)
      attack(:player2)
    end

    attack(:player1)

    within("div.player2") do
      expect(page).to have_content "Lose"
    end
  end
end
