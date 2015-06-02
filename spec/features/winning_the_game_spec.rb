require './app/server'
require_relative 'helpers'

feature 'Player 1' do

  before(:each) do
    test_db1
  end

  context 'players choose Fred and Boris' do

  before(:each) do
    visit '/'
    click_link 'Player 1'
    click_button 'Fred'
    click_link 'Player 2'
    click_button 'Boris'
    click_link 'Play'
  end

    scenario 'player 1 guesses Fred and wins the game' do
      expect(page).to have_content("Or have a guess:")
      select 'Fred', from: 'guess_person'
      click_button 'Guess'
      # John and Barry disappear
      expect(page).to have_content 'You win!'
    end

    scenario 'player 1 guesses Boris and does not win the game' do
      expect(page).to have_content("Or have a guess:")
      select 'Boris', from: 'guess_person'
      click_button 'Guess'
      # John and Barry disappear
      expect(page).to have_content 'Try again!'
    end

  end
end