def create_member_with_school
  visit '/members'
  click_link 'Add a member'
  fill_in 'Name', with: 'Member Name'
  fill_in 'Email', with: 'member@email.com'
  check 'School Name'
  click_button 'Create Member'
end
