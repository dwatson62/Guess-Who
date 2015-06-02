require './app/server'
require_relative 'helpers'

feature 'Player 1' do

  before(:each) do
    test_db
    @@player1.choose('Fred')
    @@player2.choose('Boris')
  end

  scenario 'asks a question and get a yes answer' do
    visit '/game'
    expect(page).to have_content("Ask a question:")
    select 'Hat', from: 'questions'
    click_button 'Ask'
    expect(page).to have_content 'Yes'
    # expect John and Barry to disappear
    click_button('Player 2')
  end
end