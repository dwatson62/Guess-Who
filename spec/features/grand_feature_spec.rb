require './app/server'

feature 'Playing the game' do

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

    scenario 'and play multiple turns' do
      expect(page).to have_content("Ask a question, player 1:")
      select 'BrownHair', from: 'questions'
      click_button 'Ask'
      expect(page).to have_content 'No'
      expect(Person.all(up1: true).length).to eq 9
      expect(page).to have_content("Ask a question, player 2:")
      select 'Beard', from: 'questions'
      click_button 'Ask'
      expect(page).to have_content 'Yes'
      expect(Person.all(up2: true).length).to eq 2
      expect(page).to have_content("Ask a question, player 1:")
      select 'Glasses', from: 'questions'
      click_button 'Ask'
      expect(page).to have_content 'Yes'
      expect(Person.all(up1: true).length).to eq 2
      expect(page).to have_content("Ask a question, player 2:")
      select 'Dan', from: 'guess_person'
      click_button 'Guess'
      expect(page).to have_content 'Try again!'
      expect(Person.all(up2: true).length).to eq 2
      expect(page).to have_content("Ask a question, player 1:")
      select 'Mollie', from: 'guess_person'
      click_button 'Guess'
      expect(page).to have_content 'Player 1 wins!'
    end

  end

end