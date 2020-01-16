class InitTest
  def initialize(url:, wpt_key:)
    @url = url
    @wpt_key = wpt_key
  end

  def run
    {
      wpt_id: wpt_response['data']['testId'],
      status: status,
      status_code: status_code
    }
  end

  private

  def config
    WebPageTestConfig
  end

  def query_params
    {
      f: 'json',
      url: @url,
      k: @wpt_key
    }.to_query
  end

  def wpt_init_test
    require 'net/http'
    require 'json'
    uri = URI(config.run + query_params)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def wpt_response
    @wpt_response ||= wpt_init_test
  end

  def status_code
    wpt_response['statusCode'] == 200 ? 102 : wpt_response['statusCode']
  end

  def status
    wpt_response['statusCode'] == 200 ? 'Test Initiated' : wpt_response['statusCode']
  end
end
