def enter_names
  visit "/"

  fill_in('Player 1 name', :with => 'John')
  fill_in('Player 2 name', :with => 'Jane')

  click_button('Submit')
end
