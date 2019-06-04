require 'rails_helper'

feature 'Websites homepage' do
  before do
    generate_sample_data
    visit websites_path
  end

  scenario 'has accessible page' do
    page_should_exist
  end
  scenario 'has website data' do
    should_see '1 Example Website http://www.examplewebsite.com/'
  end
  scenario 'can navigate to single website' do
    click_on 'view', match: :first
    page_should_exist
  end
end

feature 'Website subpage' do
  before do
    generate_sample_data
    visit website_path(1)
  end

  scenario 'has website settings' do
    should_see 'ID 1'
    should_see 'Name Example Website'
    should_see 'URL http://www.examplewebsite.com/'
  end
  scenario 'has profiles' do
    should_see 'EW - Homepage'
    should_see 'EW - Subpage'
  end
  scenario 'can navigate to profile' do
    click_on 'view', match: :first
    page_should_be(profile_path(1))
  end
  scenario 'has reports' do
    should_see 'EW - Homepage 12345'
    should_see 'EW - Homepage 23456'
  end
  scenario 'can navigate to report' do
    # TODO: I don't like this syntax, find a better way
    within_table_row(8) do
      click_on 'view'
    end
    page_should_be(report_path(1))
  end
end

feature 'New website' do
  before do
    visit new_website_path
  end

  scenario 'has a header' do
    should_see 'Add a New Website'
  end
  scenario 'has a submittable form' do
    fill_in 'Name', with: 'Example Website'
    fill_in 'Url', with: 'http://www.examplewebsite.com'
    click_on 'Add New Site'
    should_see 'Example Website http://www.examplewebsite.com'
  end
  scenario 'form has errors when name is empty' do
    fill_in 'Name', with: nil
    fill_in 'Url', with: 'http://www.examplewebsite.com'
    click_on 'Add New Site'
    should_see "Name can't be blank"
  end
  scenario 'form has errors when url is empty' do
    fill_in 'Name', with: 'Example Website'
    fill_in 'Url', with: nil
    click_on 'Add New Site'
    should_see "Url can't be blank"
  end
end
