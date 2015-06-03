require './app/server'

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

    scenario 'player 1 asks if he has a hat and get a yes answer' do
      expect(page).to have_content("Ask a question, player 1:")
      select 'Hat', from: 'questions'
      click_button 'Ask'
      expect(page).to have_content 'Yes'
      expect(Person.all(up1: true).length).to eq 3
    end

    scenario 'player 1 asks "hat", player 2 then asks if he has black hair and gets a no' do
      expect(page).to have_content("Ask a question, player 1:")
      select 'Hat', from: 'questions'
      click_button 'Ask'
      expect(page).to have_content 'Yes'
      expect(page).to have_content("Ask a question, player 2:")
      select 'BlackHair', from: 'questions'
      click_button 'Ask'
      expect(page).to have_content 'No'
      expect(Person.all(up2: true).length).to eq 3
    end

  end

  context 'players choose John and Boris' do

    before(:each) do
      visit '/'
      click_link 'Player 1'
      click_button 'John'
      click_link 'Player 2'
      click_button 'Boris'
      click_link 'Play'
    end

    scenario 'player 1 asks if he has brown hair and gets a no answer' do
      expect(page).to have_content("Ask a question, player 1:")
      select 'BrownHair', from: 'questions'
      click_button 'Ask'
      expect(page).to have_content 'No'
      expect(Person.all(up1: true).length).to eq 4
    end

    scenario 'player 1 asks "brown hair", player 2 then asks if he has black hair and gets a yes' do
      expect(page).to have_content("Ask a question, player 1:")
      select 'BrownHair', from: 'questions'
      click_button 'Ask'
      expect(page).to have_content("Ask a question, player 2:")
      select 'BlackHair', from: 'questions'
      click_button 'Ask'
      expect(page).to have_content 'Yes'
      expect(Person.all(up2: true).length).to eq 2
    end

  end

end