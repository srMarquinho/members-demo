require 'rails_helper'

feature 'SCHOOLS' do
  context 'no schools have been added' do
    scenario 'should display a prompt to add a school' do
      visit '/schools'
      expect(page).to have_content 'No schools yet'
      expect(page).to have_link 'Add a school'
    end
  end

  context 'creating schools' do
    before { School.create(name: 'School Name Unique') }

    scenario 'prompts user to fill out a form, then displays the new school' do
      visit '/schools'
      click_link 'Add a school'
      fill_in 'Name', with: 'School Name'
      click_button 'Create School'
      expect(page).to have_content 'School Name'
      expect(current_path).to eq '/schools'
    end

    scenario 'name is present' do
      visit '/schools'
      click_link 'Add a school'
      fill_in 'Name', with: ''
      click_button 'Create School'
      expect(page).to have_content("Name can't be blank")
      expect(current_path).to eq '/schools'
    end

    scenario 'name is unique' do
      visit '/schools'
      click_link 'Add a school'
      fill_in 'Name', with: 'School Name Unique'
      click_button 'Create School'
      expect(page).to have_content("Name has already been taken")
      expect(current_path).to eq '/schools'
    end
  end

  context 'viewing schools' do
    let!(:school){ School.create(name:'School Name') }

    scenario 'lets a user view a school' do
      visit '/schools'
      click_link 'School Name'
      expect(page).to have_content 'School Name'
      expect(current_path).to eq "/schools/#{school.id}"
    end

    scenario 'lets a user view a school AND its members' do
      create_member_with_school
      visit '/schools'
      click_link 'School Name'
      expect(page).to have_content 'School Name'
      expect(page).to have_content 'Member Name'
      expect(current_path).to eq "/schools/#{school.id}"
    end
  end

  context 'editing schools' do
    let!(:school){ School.create(name:'School Name') }

    scenario 'let a user edit a school' do
      visit '/schools'
      click_link 'School Name'
      click_link 'Edit'
      fill_in 'Name', with: 'School Edited'
      click_button 'Update School'
      expect(page).to_not have_content 'School Name'
      expect(page).to have_content 'School Edited'
      expect(current_path).to eq "/schools/#{school.id}"
    end
  end

  context 'deleting schools' do
    before { School.create(name: 'School Name') }

    scenario 'removes a school when a user clicks a delete link' do
      visit '/schools'
      click_link 'School Name'
      click_link 'Delete'
      expect(page).not_to have_content 'School Name'
      expect(page).to have_content 'School deleted successfully'
    end
  end
end
