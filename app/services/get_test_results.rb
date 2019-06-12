class GetTestResults
  attr_reader :report

  def initialize(report:)
    @report = report
  end

  def config
    WebPageTestConfig
  end

  def update
    binding.pry
    first_view = wpt_response['data']['runs']['1']['firstView']
    @report.update!(
      data: wpt_response['data'],
      load_time: first_view['loadTime'],
      ttfb: first_view['TTFB'],
      bytes_out: first_view['bytesOut'],
      bytes_out_doc: first_view['bytesOutDoc'],
      bytes_in: first_view['bytesIn'],
      bytes_in_doc: first_view['bytesInDoc'],
      connections: first_view['connections'],
      requests_full: first_view['requestsFull'],
      requests_doc: first_view['requestsDoc'],
      render: first_view['render'],
      fully_loaded: first_view['fullyLoaded'],
      dom_ements: first_view['domElements']
    )
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
