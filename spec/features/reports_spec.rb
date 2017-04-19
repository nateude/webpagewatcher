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

feature 'New Report' do
  describe 'Form' do
    before :each do
      website_data
      profile_data
      visit new_report_path
    end

    scenario 'has a header' do
      should_see 'Add a New Report'
    end
    scenario 'has a submittable form' do
      select 'Example Website', from: 'Website'
      select 'EW - Homepage', from: 'Profile'
      click_on 'Start Report'
      should_see 'Website Example Website'
      should_see 'Profile EW - Homepage'
    end
    scenario 'form has errors when website is empty' do
      select 'EW - Homepage', from: 'Profile'
      click_on 'Add New Profile'
      should_see "Name can't be blank"
    end
    scenario 'form has errors when profile is empty' do
      select 'Example Website', from: 'Website'
      click_on 'Add New Profile'
      should_see "Website can't be blank"
    end
  end
end
