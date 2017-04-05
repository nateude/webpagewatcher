require 'rails_helper'

feature 'Websites' do
    before :each do
      generateSampleData
    end

  describe "index" do
    before :each do
      visit websites_path
    end
    it "has accessible page" do
      page_should_exist
    end
    it "has website data" do
      should_see "1 Example Website http://www.examplewebsite.com/"
    end
    it "can navigate to single website" do
      click_on "view", match: :first
      page_should_exist
    end
  end

  describe "subpage" do
    before :each do
      visit website_path(1)
    end
    it "has website settings" do
      should_see "ID 1"
      should_see "Name Example Website"
      should_see "URL http://www.examplewebsite.com/"
    end
    it "has profiles" do
      should_see "EW - Homepage"
      should_see "EW - Subpage"
    end
    it "can navigate to profile" do
      click_on "view", match: :first
      page_should_be(profile_path(1))
    end
    it "has reports" do
      should_see "EW - Homepage 12345"
      should_see "EW - Homepage 23456"
    end
    it "can navigate to report" do
      # TODO I don't like this syntax, find a better way
      within_table_row(8) do
        click_on "view"
      end
      page_should_be(report_path(1))
    end
  end
end
