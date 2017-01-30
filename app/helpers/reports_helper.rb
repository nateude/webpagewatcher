module ReportsHelper

  def valid_json?(json)
    begin
      JSON.parse(json)
      return true
    rescue JSON::ParserError => e
      return false
    end
  end

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

  def wpt_check_status(report_id)
      require 'net/http'
      require 'json'
      url = 'http://www.webpagetest.org/testStatus.php?f=json&test='+report_id
      uri = URI(url)
      response = Net::HTTP.get(uri)
      wpt = JSON.parse(response)
      results = wpt['statusText']
  end
  def wpt_get_data(report_id)
      require 'net/http'
      require 'json'
      url = 'http://www.webpagetest.org/results.php?f=json&test='+report_id
      uri = URI(url)
      response = Net::HTTP.get(uri)
  end
  def parse_data(json_data)
    if valid_json?(json_data)
    else
      'invalid JSON'
    end
  end
end
