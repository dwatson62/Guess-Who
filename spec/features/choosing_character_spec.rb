require './app/server'

feature 'Each player' do
  scenario 'chooses a character' do
    test_db1
    visit '/'
    expect(page).to have_content("Guess Who")
    click_link 'Player 1'
    expect(page).to have_content('Please select a character')
    click_button 'Fred'
    expect(page).to have_content('Player 1 chose Fred')
    click_link 'Player 2'
    expect(page).to have_content('Please select a character')
    click_button 'John'
    expect(page).to have_content('Player 2 chose John')
    click_link 'Play'
    expect(current_path).to eq '/game'
  end

  scenario 'chooses other characters' do
    test_db1
    visit '/'
    click_link 'Player 1'
    click_button 'Brian'
    click_link 'Player 2'
    click_button 'John'
    click_link 'Play'
  end
end