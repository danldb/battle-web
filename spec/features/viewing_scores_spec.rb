require "spec_helper"

feature "Viewing scores" do
  scenario "player 1 sees Player 2's Hit Points" do
    enter_names

    within(:css, "div#player2") do
      expect(page).to have_content('0/60 HP')
    end
  end

  def enter_names
    visit "/"

    fill_in('Player 1 name', :with => 'John')
    fill_in('Player 2 name', :with => 'Jane')

    click_button('Submit')
  end
end
