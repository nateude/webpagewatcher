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
    it "has index with template and data" do
      visit '/websites'
      expect(page.status_code).to eq(200)
    end
    it "has subpages and can navigate" do
      visit '/websites'
      click_link("view", :match => :first)
      expect(page.status_code).to eq(200)
    end
  end
  describe "subpage" do
    before :each do
      visit '/websites/1'
    end
    it "has website data" do
      expect(find('h1')).to have_content("sample")
      expect(find('table.website-data')).to have_selector 'tr', count: 4
    end
    it "has report data" do
      expect(find('table.associated-reports')).to have_selector 'tr', count: 3
    end
    it "has profile data" do
      expect(find('h1')).to have_content("sample")
      expect(find('table.associated-profiles')).to have_selector 'tr', count: 3
    end
    it "can navigate to profile" do
      page.find('.associated-profiles').click_link('view', :match => :first)
      expect(page.status_code).to eq(200)
    end
    it "can navigate to report" do
      page.find('.associated-reports').click_link('view', :match => :first)
      expect(page.status_code).to eq(200)
    end
  end
end
