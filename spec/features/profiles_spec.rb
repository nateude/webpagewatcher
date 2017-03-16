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


feature 'Websites New' do
  describe "Form" do
    before :each do
      Website.create(
        name: 'Sample Website',
        url: 'http://www.sample.com/'
      )
      visit '/profiles/new'
    end

    it "has forms" do
      expect(page).to have_selector('input#profile_name')
      expect(page).to have_selector('select#profile_website_id')
      expect(page).to have_selector('input#profile_url')
    end
    it "can not submit form without required fields" do
      click_on('Add New Profile')
      expect(page.current_path).to eql new_profile_path
    end
    it "has error responses"
    it "can submit form" do
      fill_in('Name', :with => 'Sample Profile')
      select('Sample Website', :from => 'Website')
      fill_in('Url', :with => 'http://www.sample.com')
      click_on('Add New Profile')
      expect(page.current_path).to eql profiles_path
      expect(page).to have_content("Sample Profile")
    end

  end
end
