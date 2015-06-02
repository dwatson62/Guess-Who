require './app/server'
require_relative 'helpers'

feature 'Each player' do
  scenario 'chooses a character' do
    visit '/'
    expect(page).to have_content("Guess Who")
    click_link 'Player 1'
    expect(page).to have_content('Please select a character')
    click_button 'Fred'
    expect(page).to have_content('You have selected Fred')
    click_link 'Player 2'
    expect(page).to have_content('Please select a character')
    click_button 'John'
    expect(page).to have_content('You have selected John')
  end
end