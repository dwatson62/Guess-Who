require './app/server'
require_relative 'helpers'

feature 'Each player' do

  before(:each) do
    test_db
    @@player1.choose('Fred')
    @@player2.choose('Boris')
  end

  scenario 'asks a question' do
    visit '/game'
    expect(page).to have_content("Ask a question:")
    select 'Hat', from: 'questions'
    click_button 'Ask'
  end
end