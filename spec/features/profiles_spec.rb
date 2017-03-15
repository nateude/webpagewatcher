require 'rails_helper'

feature 'Profiles' do
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
      visit '/profiles'
    end
    it "has index with template and data" do
      expect(find('h1')).to have_content("Profiles")
    end
    it "has profile data" do
      expect(page).to have_content("profile test first")
      expect(page).to have_link(href: "/profiles/1")
    end
    it "has multipule profile data" do
      expect(page).to have_content("profile test second")
      expect(page).to have_link(href: "/profiles/2")
    end
    it "can navigate to profile" do
      click_on 'profile test first'
      expect(find('h1')).to have_content("profile test first")
    end
  end
  describe "subpage" do
    before :each do
      visit '/profiles/1'
    end
    it "has settings and asscoiated reports" do
      expect(find('h1')).to have_content("profile test first")
      expect(find('table.associated-reports')).to have_link 'view', count: 2
    end
    it "has link to report" do
      click_link("view", :match => :first)
      expect(page.status_code).to eq(200)
    end
  end
end
