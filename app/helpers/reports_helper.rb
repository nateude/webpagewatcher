module ReportsHelper
  def wpt_url
    "http://www.webpagetest.org/results.php"
  end

  def wpt_test_url(report)

    if !report.wpt_id.nil?
     wpt_url()+"?test="+report.wpt_id
    else
      "false"
    end
  end

  def wpt_params(report)

      website = Website.find(report['website_id'])
      profile = Profile.find(report['profile_id'])
      params = {
        :f    => 'json',
        :url => website.url,
        :k   => website.api_key
      }
  end

  def wpt_init_request(report)
      require 'net/http'
      require 'json'
      url = 'http://www.webpagetest.org/runtest.php?'+wpt_params(report).to_query
      uri = URI(url)
      response = Net::HTTP.get(uri)
      wpt = JSON.parse(response)
      results = {
        :status => wpt['statusText'],
        :wpt_id => wpt['data']['testId']
      }
  end
end
