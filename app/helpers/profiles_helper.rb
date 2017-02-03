module ProfilesHelper

  def getApi(profile)
    if profile.api_key.empty?
      website = Website.find(profile.website_id)
      website.api_key
    else
      profile.api_key
    end
  end

  def generate_report(profile)
    report_hash = {:report => {:website_id => profile.website_id, :profile_id => profile.id}}
  end

end
