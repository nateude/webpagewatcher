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
        wpt_id: '12345',
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
      visit profiles_path
    end
    it "has accessible page" do
      page_should_exist
    end
    it "has profile data" do
      should_see "profile test first"
    end
    it "can display multipule profiles" do
      should_see "profile test second"
    end
    it "can navigate to single profile" do
      click_on 'profile test first'
      should_see "profile test first"
    end
  end

  describe "subpage" do
    before :each do
      visit profile_path(1)
    end
    it "has profile settings" do
      should_see "ID 1"
      should_see "Name profile test first"
      should_see "Website sample"
    end
    it "has report" do
      should_see "1 100 12345"
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
      Website.create(
        name: 'Sample Website',
        url: 'http://www.sample.com/'
      )
      visit new_profile_path
    end

    it "can submit form with data" do
      fill_in 'Name', with: 'New Sample Profile'
      select 'Sample Website', from: 'Website'
      fill_in 'Url', with: 'http://www.sample.com'
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
