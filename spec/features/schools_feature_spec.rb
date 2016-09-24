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
    before { School.create(name: 'School_1') }

    scenario 'display schools' do
      visit '/schools'
      expect(page).to have_content('School_1')
      expect(page).not_to have_content('No schools yet')
    end
  end

  context 'creating schools' do
    scenario 'prompts user to fill out a form, then displays the new school' do
      visit '/schools'
      click_link 'Add a school'
      fill_in 'Name', with: 'School_2'
      click_button 'Create School'
      expect(page).to have_content 'School_2'
      expect(current_path).to eq '/schools'
    end
  end

  context 'viewing schools' do
    let!(:school){ School.create(name:'School_3') }

    scenario 'lets a user view a school' do
     visit '/schools'
     click_link 'School_3'
     expect(page).to have_content 'School_3'
     expect(current_path).to eq "/schools/#{school.id}"
    end
  end

  context 'editing schools' do
    let!(:school){ School.create(name:'School_4') }

    scenario 'let a user edit a school' do
     visit '/schools'
     click_link 'School_4'
     click_link 'Edit'
     fill_in 'Name', with: 'School_5'
     click_button 'Update School'
     expect(page).to_not have_content 'School_4'
     expect(page).to have_content 'School_5'
     expect(current_path).to eq "/schools/#{school.id}"
    end

  end
end
