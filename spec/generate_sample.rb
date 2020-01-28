# TODO: replace with factories & factory girl
def generate_sample_data
  website_data
  profile_data
  report_data(1)
  report_data(2)
end

def user_data
  User.create(
    email: 'user@webpagewatcher.com',
    name: 'user',
    password: 'password'
  )
end

def website_data
  Website.create(
    name: 'Example Website',
    url: 'http://www.examplewebsite.com/',
    user_id: 1
  )
end

def profile_data
  Profile.create(
    name: 'EW - Homepage',
    website_id: '1',
    wpt_settings: nil,
    wpt_code: nil,
    interval: nil,
    url: 'http://www.examplewebsite.com/'
  )
  Profile.create(
    name: 'EW - Subpage',
    website_id: '1',
    wpt_settings: nil,
    wpt_code: nil,
    interval: nil,
    url: 'http://www.examplewebsite.com/subpage'
  )
end

def report_data(profile_id)
  Report.create(
    profile_id: profile_id,
    wpt_id: '12345',
    status: 'Test Complete',
    data: nil,
    status_code: '200'
  )
  Report.create(
    profile_id: profile_id,
    wpt_id: '23456',
    status: 'Test Complete',
    data: nil,
    status_code: '200'
  )
end
