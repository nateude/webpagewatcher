module ReportsHelper


  def wpt_test_url(report)

    if !report.wpt_id.nil?
      "http://www.webpagetest.org/results.php?test="+report.wpt_id
    else
      "false"
    end
  end

  def wpt_api_call(page,params,type)
      require 'net/http'
      require 'json'
      url = 'http://www.webpagetest.org/'+page+'.php?'+params.to_query
      uri = URI(url)
      response = Net::HTTP.get(uri)
      if (type == 'json')
        wpt = JSON.parse(response)
      end
  end

  def wpt_init_request(report)

      website = Website.find(report['website_id'])
      profile = Profile.find(report['profile_id'])
      params = {
        :f    => 'json',
        :url => website.url,
        :k   => website.api_key
      }
      response = wpt_api_call('runtest',params,'json')
      results = {
        :status_code => response['statusCode'],
        :wpt_id => response['data']['testId']
      }
  end

  def wpt_check_status(report_id)
      params = {
        :f    => 'json',
        :test => report_id
      }
      response = wpt_api_call('testStatus',params,'json')
  end

  def wpt_get_data(report_id)
      params = {
        :f    => 'json',
        :test => report_id
      }
      response = wpt_api_call('results',params,false)
  end

  def report_update(report)
      wpt = wpt_check_status(report.wpt_id)
      if wpt['statusCode'] == 200
        wpt_data = wpt_get_data(report.wpt_id)
        report.update_attributes(status: wpt['statusText'],status_code: wpt['statusCode'], data: wpt_data)
        mssg = "data updated: "+wpt_data
      else
        report.update_attributes(status: wpt['statusText'],status_code: wpt['statusCode'])
        mssg = "data not updated"
      end
      mssg
  end
end
