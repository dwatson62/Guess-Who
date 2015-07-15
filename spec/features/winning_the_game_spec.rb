require './app/server'
require './crowd_data'

feature 'To win the game' do
  context 'players have chosen Fred and Boris' do
    before(:each) do
      test_db
      visit '/'
      click_link 'Player 1'
      click_button 'Fred'
      click_link 'Player 2'
      click_button 'Boris'
      click_link 'Play'
    end
    scenario 'player 1 guesses Boris to win the game' do
      expect(page).to have_content('Ask a question, player 1:')
      expect(page).to have_content('Or have a guess:')
      select 'Boris', from: 'guess_person'
      click_button 'Guess'
      expect(page).to have_content 'Player 1 wins!'
    end
    scenario 'player 1 guesses Brian, but does not win the game' do
      expect(page).to have_content('Ask a question, player 1:')
      expect(page).to have_content('Or have a guess:')
      select 'Brian', from: 'guess_person'
      click_button 'Guess'
      expect(page).to have_content 'Try again!'
      expect(Person.all(up1: true).length).to eq 4
    end
  end

  context 'players have chosen Rodney and Mollie' do
    before(:each) do
      april_db
      visit '/'
      click_link 'Player 1'
      click_button 'Rodney'
      click_link 'Player 2'
      click_button 'Mollie'
      click_link 'Play'
    end
    scenario 'player 1 guesses Mollie to win the game' do
      expect(page).to have_content('Ask a question, player 1:')
      expect(page).to have_content('Or have a guess:')
      select 'Mollie', from: 'guess_person'
      click_button 'Guess'
      expect(page).to have_content 'Player 1 wins!'
    end
    scenario 'player 1 guesses Daryl, but does not win the game' do
      expect(page).to have_content('Ask a question, player 1:')
      expect(page).to have_content('Or have a guess:')
      select 'Daryl', from: 'guess_person'
      click_button 'Guess'
      expect(page).to have_content 'Try again!'
      expect(Person.all(up1: true).length).to eq 15
    end
  end
end
