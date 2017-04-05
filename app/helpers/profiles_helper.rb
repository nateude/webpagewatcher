module ProfilesHelper
  def generate_report(profile)
    { report: { website_id: profile.website_id, profile_id: profile.id } }
  end
end
