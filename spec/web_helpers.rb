def enter_names(player1: "John", player2: "Jane")
  visit "/"

  fill_in('Player 1 name', :with => player1)
  fill_in('Player 2 name', :with => player2)

  click_button('Submit')
end

def attack(player)
  within("div.#{player}") do
    click_link "Attack"
  end
end
