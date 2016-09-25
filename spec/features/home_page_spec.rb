require 'rails_helper'

feature 'HOME' do
  context 'has a menu' do
    scenario 'schools link' do
      visit '/'
      click_link 'Schools'
      expect(current_path).to eq '/schools'
    end

    scenario 'members link' do
      visit '/'
      click_link 'Members'
      expect(current_path).to eq '/members'
    end
  end
end
