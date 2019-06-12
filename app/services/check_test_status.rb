class CheckTestStatus
  attr_reader :report

  def initialize(report:)
    @report = report
  end

  def config
    WebPageTestConfig
  end

  def update
    @report.update!(
      status: wpt_response['statusText'],
      status_code: wpt_response['statusCode']
    )
  end

  def query_params
    {
      f: 'json',
      test: @report.wpt_id
    }.to_query
  end

  def wpt_test_status
    require 'net/http'
    require 'json'
    uri = URI(config.status + query_params)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def wpt_response
    @wpt_response ||= wpt_test_status
  end
end
