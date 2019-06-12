# require 'rails_helper'
#
# feature 'Profiles' do
#   before do
#     generate_sample_data
#   end
#
#   describe 'index' do
#     before do
#       visit profiles_path
#     end
#
#     it 'has accessible page' do
#       page_should_exist
#     end
#     it 'has profile data' do
#       should_see 'EW - Homepage'
#     end
#     it 'can display multipule profiles' do
#       should_see 'EW - Subpage'
#     end
#     it 'can navigate to single profile' do
#       click_on 'EW - Homepage'
#       page_should_be(profile_path(1))
#     end
#   end
#
#   describe 'subpage' do
#     before do
#       visit profile_path(1)
#     end
#
#     it 'has profile settings' do
#       should_see 'ID 1'
#       should_see 'Name EW - Homepage'
#       should_see 'Website Example Website'
#     end
#     it 'has report' do
#       should_see '12345'
#     end
#     it 'has link to report' do
#       click_on 'view', match: :first
#       page_should_be(report_path(1))
#     end
#   end
# end
#
# feature 'New Profile' do
#   describe 'Form' do
#     before do
#       website_data
#       visit new_profile_path
#     end
#
#     scenario 'has a header' do
#       should_see 'Add a New Profile'
#     end
#     scenario 'has a submittable form' do
#       fill_in 'Name', with: 'Example Profile'
#       select 'Example Website', from: 'Website'
#       fill_in 'Url', with: 'http://www.examplewebsite.com'
#       click_on 'Add New Profile'
#       should_see 'Example Profile Example Website http://www.examplewebsite.com'
#     end
#     scenario 'form has errors when name is empty' do
#       select 'Example Website', from: 'Website'
#       fill_in 'Url', with: 'http://www.examplewebsite.com'
#       click_on 'Add New Profile'
#       should_see "Name can't be blank"
#     end
#     scenario 'form has errors when url is empty' do
#       fill_in 'Name', with: 'Example Profile'
#       fill_in 'Url', with: 'http://www.examplewebsite.com'
#       click_on 'Add New Profile'
#       should_see "Website can't be blank"
#     end
#   end
# end
