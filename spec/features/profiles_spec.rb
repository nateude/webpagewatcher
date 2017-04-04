require 'rails_helper'

feature 'Profiles' do
    before :each do
      generateSampleData
    end

  describe "index" do
    before :each do
      visit profiles_path
    end
    it "has accessible page" do
      page_should_exist
    end
    it "has profile data" do
      should_see "EW - Homepage"
    end
    it "can display multipule profiles" do
      should_see "EW - Subpage"
    end
    it "can navigate to single profile" do
      click_on 'EW - Homepage'
      page_should_be(profile_path(1))
    end
  end

  describe "subpage" do
    before :each do
      visit profile_path(1)
    end
    it "has profile settings" do
      should_see "ID 1"
      should_see "Name EW - Homepage"
      should_see "Website Example Website"
    end
    it "has report" do
      should_see "12345"
    end
    it "has link to report" do
      click_on "view", match: :first
      page_should_be(report_path(1))
    end
  end

end

feature 'New Profile' do
  describe "Form" do
    before :each do
      websiteData
      visit new_profile_path
    end

    it "can submit form with data" do
      fill_in 'Name', with: 'New Sample Profile'
      select 'Example Website', from: 'Website'
      fill_in 'Url', with: 'http://www.examplewebsite.com/'
      click_on 'Add New Profile'
      should_see "New Sample Profile"
    end

    it "can not submit form without data" do
      click_on 'Add New Profile'
      expect(Profile.count).to eq(0)
    end

    it "has error responses"

  end
end
