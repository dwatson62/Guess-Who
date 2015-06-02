require './app/server'
require_relative 'helpers'

feature 'Player 1' do

  before(:each) do
    test_db1
  end

  scenario 'asks if they have a hat and get a yes answer' do
    @@game1.choose('Fred')
    @@game2.choose('Boris')
    visit '/game'
    expect(page).to have_content("Ask a question:")
    select 'Hat', from: 'questions'
    click_button 'Ask'
    # John and Barry disappear
    expect(@@game1.show_all.length).to eq 3
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
    p PersonTraits.all
    expect(@@game1.show_all.length).to eq 2
  end
end