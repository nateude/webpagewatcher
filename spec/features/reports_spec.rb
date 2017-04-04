require 'rails_helper'

feature 'Reports' do
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
        status: 'Test Complete',
        data: 'null',
        status_code: '200'
      )
      Report.create(
        website_id:'1',
        profile_id: '1',
        wpt_id: '23456',
        status: 'Test Complete',
        data: 'null',
        status_code: '200'
      )
    end

  describe "index" do
    before :each do
      visit reports_path
    end
    it "has accessible page" do
      page_should_exist
    end
    it "has report data" do
      should_see "12345"
    end
    it "can display multipule reports" do
      should_see "23456"
    end
    it "can navigate to single report" do
      click_on 'view', match: :first
      page_should_be(report_path(1))
    end
  end

  describe "subpage" do
    before :each do
      visit report_path(1)
    end
    it "has settings" do
      should_see "ID 1"
      should_see "Status_code 200"
      should_see "Website sample"
      should_see "Profile profile test first"
      should_see "WPT ID 12345"
    end
  end
end
