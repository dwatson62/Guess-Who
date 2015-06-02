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

    xscenario 'player 1 asks if he has a hat and get a yes answer' do
      expect(page).to have_content("Ask a question:")
      select 'Hat', from: 'questions'
      click_button 'Ask'
      # John and Barry disappear
      expect(Person.all(up: true).length).to eq 3
    end

    scenario 'player 1 asks if he has a hat and then black hair, and gets a yes then a no' do
      expect(page).to have_content("Ask a question:")
      select 'Hat', from: 'questions'
      click_button 'Ask'
      # John and Barry disappear
      select 'BlackHair', from: 'questions'
      click_button 'Ask'
      # Fred and Boris remain
      expect(Person.all(up: true).length).to eq 2
    end

  end



  xscenario 'asks if they have a hat and get a no answer' do
    @@game1.choose('John')
    @@game2.choose('Boris')
    visit '/game'
    expect(page).to have_content("Ask a question:")
    select 'Hat', from: 'questions'
    click_button 'Ask'
    # Fred, Boris and Brian disappear
    expect(@@game1.show_all.length).to eq 2
  end

  xscenario 'asks if they have black hair and get a yes answer' do
    @@game1.choose('Brian')
    @@game2.choose('Boris')
    visit '/game'
    expect(page).to have_content("Ask a question:")
    select 'BlackHair', from: 'questions'
    click_button 'Ask'
    # Fred, Boris and Barry disappear
    expect(@@game1.show_all.length).to eq 2
  end
end