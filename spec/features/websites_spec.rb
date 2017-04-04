require 'rails_helper'

feature 'Websites' do
    before :each do
      Website.create(
        name: 'sample',
        url: 'http://www.sample.com/'
      )
      Profile.create(
        name: 'profile test first',
        website_id: '1',
        wpt_settings: 'empty',
        wpt_code: 'empty',
        interval: '100',
        url: 'http://www.sample.com'
      )
      Profile.create(
        name: 'profile test second',
        website_id: '1',
        wpt_settings: 'empty',
        wpt_code: 'empty',
        interval: '100',
        url: 'http://www.sample.com'
      )
      Report.create(
        website_id:'1',
        profile_id: '1',
        wpt_id: '12345',
        status: '200',
        data: 'null',
        status_code: '1'
      )
      Report.create(
        website_id:'1',
        profile_id: '1',
        wpt_id: '23456',
        status: '200',
        data: 'null',
        status_code: '1'
      )
    end

  describe "index" do
    before :each do
      visit websites_path
    end
    it "has accessible page" do
      page_should_exist
    end
    it "has website data" do
      should_see "1 sample http://www.sample.com/ 2 view"
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
      should_see "Name sample"
      should_see "URL http://www.sample.com/"
    end
    it "has profiles" do
      should_see "profile test first"
      should_see "profile test second"
    end
    it "can navigate to profile" do
      click_on "view", match: :first
      page_should_be(profile_path(1))
    end
    it "has reports" do
      should_see "1 200 profile test first 12345 view"
      should_see "2 200 profile test first 23456 view"
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
