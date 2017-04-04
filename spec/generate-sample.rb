#TODO replace with factories & factory girl
def generateSampleData
  websiteData
  profileData
  reportData(1)
  reportData(2)
end

def websiteData
  Website.create(
    name: 'Example Website',
    url: 'http://www.examplewebsite.com/'
  )
end

def profileData
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

def reportData(profile_id)
  Report.create(
    website_id:'1',
    profile_id: profile_id,
    wpt_id: '12345',
    status: 'Test Complete',
    data: nil,
    status_code: '200'
  )
  Report.create(
    website_id:'1',
    profile_id: profile_id,
    wpt_id: '23456',
    status: 'Test Complete',
    data: nil,
    status_code: '200'
  )
end
