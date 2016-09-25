require 'rails_helper'

feature 'members' do
  context 'no members have been added' do
    scenario 'should display a prompt to add a member' do
      visit '/members'
      expect(page).to have_content 'No members yet'
      expect(page).to have_link 'Add a member'
    end
  end

  context 'members have been added' do
    before { Member.create(name: 'Member Name', email: 'member@email.com') }

    scenario 'display members' do
      visit '/members'
      expect(page).to have_content('Member Name')
      expect(page).to have_content('member@email.com')
      expect(page).not_to have_content('No members yet')
    end
  end

  context 'creating members' do
    before { School.create(name: 'School Name') }
    before { Member.create(name: 'Member Name Unique', email: 'member@email.com') }

    scenario 'prompts user to fill out a form, then displays the new member' do
      visit '/members'
      click_link 'Add a member'
      fill_in 'Name', with: 'Member Name'
      fill_in 'Email', with: 'member@email.com'
      click_button 'Create Member'
      expect(page).to have_content('Member Name')
      expect(page).to have_content('member@email.com')
      expect(current_path).to eq '/members'
    end

    scenario 'can select a school' do
      visit '/members'
      click_link 'Add a member'
      fill_in 'Name', with: 'Member Name'
      fill_in 'Email', with: 'member@email.com'
      check 'School Name'
      click_button 'Create Member'
      expect(page).to have_content('Member Name')
      expect(page).to have_content('member@email.com')
      expect(current_path).to eq '/members'
    end

    scenario 'name is present' do
      visit '/members'
      click_link 'Add a member'
      fill_in 'Name', with: ''
      fill_in 'Email', with: 'member@email.com'
      click_button 'Create Member'
      expect(page).to have_content("Name can't be blank")
      expect(current_path).to eq '/members'
    end

    scenario 'name is unique' do
      visit '/members'
      click_link 'Add a member'
      fill_in 'Name', with: 'Member Name Unique'
      fill_in 'Email', with: 'member@email.com'
      click_button 'Create Member'
      expect(page).to have_content("Name has already been taken")
      expect(current_path).to eq '/members'
    end

    scenario 'email is valid' do
      visit '/members'
      click_link 'Add a member'
      fill_in 'Name', with: 'Member Name'
      fill_in 'Email', with: 'memberemailcom'
      click_button 'Create Member'
      expect(page).to have_content("Email is invalid")
      expect(current_path).to eq '/members'
    end
  end

  context 'editing members' do
    let!(:member){ Member.create(name:'Member Name', email: 'member@email.com') }
    before { School.create(name: 'School Name') }

    scenario 'let a user edit a member' do
      visit '/members'
      click_link 'Edit'
      fill_in 'Name', with: 'Member Edited'
      check 'School Name'
      click_button 'Update Member'
      expect(page).to_not have_content 'Member Name'
      expect(page).to have_content 'Member Edited'
      expect(current_path).to eq '/members'
    end

    scenario 'email is valid' do
      visit '/members'
      click_link 'Edit'
      fill_in 'Name', with: 'Member Name'
      fill_in 'Email', with: 'memberemailcom'
      click_button 'Update Member'
      expect(page).to have_content("Email is invalid")
      expect(current_path).to eq "/members/#{member.id}"
    end
  end

  context 'deleting members' do
    before { Member.create(name: 'Member Name', email: 'member@email.com') }

    scenario 'removes a member when a user clicks a delete link' do
      visit '/members'
      click_link 'Delete'
      expect(page).not_to have_content 'Member Name'
      expect(page).to have_content 'Member deleted successfully'
    end
  end
end
