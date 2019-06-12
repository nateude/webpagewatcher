class GetTestResults

  attr_reader :report

  def initialize(report:)
    @report = report
  end

  def config
    WebPageTestConfig
  end

  def update
    @report.update!(data: wpt_response['data'])
  end

  def query_params
    {
      f: 'json',
      test: @report.wpt_id
    }.to_query
  end

  def wpt_get_results
    require 'net/http'
    require 'json'
    uri = URI(config.results + query_params)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def wpt_response
    @wpt_response ||= wpt_get_results
  end
end
