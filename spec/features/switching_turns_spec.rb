require "spec_helper"
require "web_helpers"

feature "Switching turns" do
  background do
    enter_names(player1: "Piccachu", player2: "Slowpoke")

    within("div.player1") do
      click_link "Attack"
    end
  end

  scenario "Piccachu attacks Slowpoke then Slowpoke attacks Piccachu" do

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

  scenario "Piccachu can only attack once" do
    within("div.player1") do
      expect(page).not_to have_content("Attack")
    end
  end
end
