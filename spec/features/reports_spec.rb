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
        wpt_id: '1',
        status: '100',
        data: 'null',
        status_code: '1'
      )
      Report.create(
        website_id:'1',
        profile_id: '1',
        wpt_id: '2',
        status: '100',
        data: 'null',
        status_code: '1'
      )
    end

  describe "index" do
    before :each do
      visit '/reports'
    end
    it "index page renders" do
      expect(page.status_code).to eq(200)
    end
    it "has multipule report data" do
      expect(find('table')).to have_selector 'tr', count: 3
    end
    it "can navigate to report" do
      click_link("View", :match => :first)
      expect(page.status_code).to eq(200)
    end
  end
  describe "subpage" do
    before :each do
      visit '/reports/1'
    end
    it "has settings" do
      expect(find('table')).to have_selector 'tr', count: 11
    end
  end
end
