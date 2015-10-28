require "spec_helper"
require "web_helpers"

feature "Switching turns" do
  scenario "Piccachu attacks Slowpoke then Slowpoke attacks Piccachu" do
    enter_names(player1: "Piccachu", player2: "Slowpoke")

    within("div.player1") do
      click_link "Attack"
    end

    expect(page).to have_content("Piccachu attacked Slowpoke!")
    within("div.player2") do
      expect(page).to have_content("40/60 HP")
    end

    within("div.player2") do
      click_link "Attack"
    end

    expect(page).to have_content("Slowpoke attacked Piccachu!")
    within("div.player1") do
      expect(page).to have_content("40/60 HP")
    end
  end
end
