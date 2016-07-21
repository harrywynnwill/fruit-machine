require 'spec_helper'

feature 'Enter bet' do
  scenario 'Submitting bet amount' do
    visit('/')
      fill_in :bet_amount, with: 1
      click_button 'Submit'
      expect(page).to have_content 1
  end
end
