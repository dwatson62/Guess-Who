require './app/server'
require_relative 'helpers'

feature 'Player 1' do

  before(:each) do
    test_db1
  end

  scenario 'asks if they have a hat and get a yes answer' do
    @@player1.choose('Fred')
    @@player2.choose('Boris')
    visit '/game'
    expect(page).to have_content("Ask a question:")
    select 'Hat', from: 'questions'
    click_button 'Ask'
    # John and Barry disappear
    expect(@@player1.show_all.length).to eq 3
  end
  scenario 'asks if they have a hat and get a no answer' do
    @@player1.choose('John')
    @@player2.choose('Boris')
    visit '/game'
    expect(page).to have_content("Ask a question:")
    select 'Hat', from: 'questions'
    click_button 'Ask'
    # John and Barry disappear
    expect(@@player1.show_all.length).to eq 2
  end

  xscenario 'asks if they have black hair and get a yes answer' do
    @@player1.choose('Brian')
    @@player2.choose('Boris')
    visit '/game'
    expect(page).to have_content("Ask a question:")
    select 'BlackHair', from: 'questions'
    click_button 'Ask'
    # Fred, Boris and Barry disappear
    p PersonTraits.all
    expect(@@player1.show_all.length).to eq 2
  end
end