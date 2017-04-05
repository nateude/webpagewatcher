require 'rails_helper'

feature 'Websites' do
  before :each do
    generate_sample_data
  end

  describe 'index' do
    before :each do
      visit websites_path
    end
    it 'has accessible page' do
      page_should_exist
    end
    it 'has website data' do
      should_see '1 Example Website http://www.examplewebsite.com/'
    end
    it 'can navigate to single website' do
      click_on 'view', match: :first
      page_should_exist
    end
  end

  describe 'subpage' do
    before :each do
      visit website_path(1)
    end
    it 'has website settings' do
      should_see 'ID 1'
      should_see 'Name Example Website'
      should_see 'URL http://www.examplewebsite.com/'
    end
    it 'has profiles' do
      should_see 'EW - Homepage'
      should_see 'EW - Subpage'
    end
    it 'can navigate to profile' do
      click_on 'view', match: :first
      page_should_be(profile_path(1))
    end
    it 'has reports' do
      should_see 'EW - Homepage 12345'
      should_see 'EW - Homepage 23456'
    end
    it 'can navigate to report' do
      # TODO: I don't like this syntax, find a better way
      within_table_row(8) do
        click_on 'view'
      end
      page_should_be(report_path(1))
    end
  end
end

feature 'New Website' do
    before :each do
      visit new_website_path
    end

  describe 'Page' do
    it 'has a header' do
      should_see 'Add a New Website'
    end

    it 'has a submittable form' do
      fill_in 'Name', with: 'Example Website'
      fill_in 'Url', with: 'http://www.examplewebsite.com'
      click_on 'Add New Site'
      should_see 'Example Website http://www.examplewebsite.com'
    end

    it 'has errors empty name' do
      fill_in 'Name', with: nil
      fill_in 'Url', with: 'http://www.examplewebsite.com'
      click_on 'Add New Site'
      should_see "Name can't be blank"
    end

    it 'has errors empty url' do
      fill_in 'Name', with: 'Example Website'
      fill_in 'Url', with: nil
      click_on 'Add New Site'
      should_see "Url can't be blank"
    end
  end

  describe 'form' do
  end

end
