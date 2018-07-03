module ReportsHelper
  def wpt_test_url(report)
    if !report.wpt_id.nil?
      'http://www.webpagetest.org/results.php?test=' + report.wpt_id
    else
      'false'
    end
  end

  def wpt_api_call(page, params)
    require 'net/http'
    require 'json'
    url = 'http://www.webpagetest.org/' + page + '.php?' + params.to_query
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def wpt_init_request(report)
    # website = Website.find(report['website_id'])
    profile = Profile.find(report['profile_id'])
    params = {
      f: 'json',
      url: profile.url,
      k: Rails.application.secrets.webpagetest_key
    }
    response = wpt_api_call('runtest', params)
    {
      status_code: response['statusCode'],
      wpt_id: response['data']['testId']
    }
  end

  def wpt_check_status(report_id)
    params = {
      f: 'json',
      test: report_id
    }
    wpt_api_call('testStatus', params)
  end

  def wpt_get_data(report_id)
    params = {
      f: 'json',
      test: report_id
    }
    wpt_api_call('results', params)
  end

  def update_all(reports)
    msgs = ''
    reports.each do |report|
      if report.status_code < 200
        report_update(report)
        msgs += ' ' + report.wpt_id + ','
      end
    end
    flash[:success] = 'Report Updated: ' + msgs if msgs != ''
  end

  def report_update(report)
    wpt = wpt_check_status(report.wpt_id)
    pramas = {
      status: wpt['statusText'],
      status_code: wpt['statusCode']
    }
    if wpt['statusCode'] == 200
      pramas[:data] = wpt_get_data(report.wpt_id).to_json
    end
    report.update(pramas)
  end

  def report_json_data
    JSON.parse(@report.data) if @report.data && JSON.json?(@report.data)
  end
end
