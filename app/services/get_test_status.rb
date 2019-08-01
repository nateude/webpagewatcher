class GetTestStatus

  def initialize(wpt_id:)
    @wpt_id = wpt_id
  end

  def call
    {
      status_code: wpt_test_status['statusCode'],
      status: wpt_test_status['statusText']
    }
  end

  private

  def config
    WebPageTestConfig
  end

  def query_params
    {
      f: 'json',
      test: @wpt_id
    }.to_query
  end

  def wpt_test_status_request
    require 'net/http'
    require 'json'
    uri = URI(config.status + query_params)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def wpt_test_status
    @wpt_test_status ||= wpt_test_status_request
  end
end
