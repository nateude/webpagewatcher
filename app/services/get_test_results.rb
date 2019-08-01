class GetTestResults
  def initialize(wpt_id:)
    @wpt_id = wpt_id
  end

  def call
    first_view = wpt_get_results['data']['runs']['1']['firstView']
    {
      data: wpt_get_results['data'],
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

  def wpt_get_results_request
    require 'net/http'
    require 'json'
    uri = URI(config.results + query_params)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def wpt_get_results
    @wpt_get_results ||= wpt_get_results_request
  end
end
