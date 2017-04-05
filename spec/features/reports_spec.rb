require 'rails_helper'

feature 'Reports' do
  before :each do
    generate_sample_data
  end

  describe 'index' do
    before :each do
      visit reports_path
    end
    it 'has accessible page' do
      page_should_exist
    end
    it 'has report data' do
      should_see '12345'
    end
    it 'can display multipule reports' do
      should_see '23456'
    end
    it 'can navigate to single report' do
      click_on 'view', match: :first
      page_should_be(report_path(1))
    end
  end

  describe 'subpage' do
    before :each do
      visit report_path(1)
    end
    it 'has settings' do
      should_see 'ID 1'
      should_see 'Status_code 200'
      should_see 'Website Example Website'
      should_see 'Profile EW - Homepage'
      should_see 'WPT ID 12345'
    end
  end
end
