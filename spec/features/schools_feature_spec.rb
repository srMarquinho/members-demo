require 'rails_helper'

feature 'schools' do
  context 'no schools have been added' do
    scenario 'should display a prompt to add a school' do
      visit '/schools'
      expect(page).to have_content 'No schools yet'
      expect(page).to have_link 'Add a school'
    end
  end

  context 'schools have been added' do
    before do
      School.create(name: 'School1')
    end

    scenario 'display schools' do
      visit '/schools'
      expect(page).to have_content('School1')
      expect(page).not_to have_content('No schools yet')
    end
  end

  context 'creating schools' do
    scenario 'prompts user to fill out a form, then displays the new school' do
      visit '/schools'
      click_link 'Add a school'
      fill_in 'Name', with: 'School2'
      click_button 'Create School'
      expect(page).to have_content 'School2'
      expect(current_path).to eq '/schools'
    end
  end
end
