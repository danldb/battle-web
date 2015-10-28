require "spec_helper"
require "web_helpers"

feature "Attacking" do
  background "Piccachu attacks Slowpoke" do
    enter_names(player1: "Piccachu", player2: "Slowpoke")

    within("div.player1") do
      click_link "Attack"
    end
  end

  scenario "and gets a confirmation" do
    expect(page).to have_content("Piccachu attacked Slowpoke!")
  end

  scenario "Slowpoke's HP reduced by 20" do
    expect(page).to have_content("40/60 HP")
  end
end
