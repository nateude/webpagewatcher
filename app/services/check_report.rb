class CheckReport

  def initialize(report:)
    @report = report
  end

  def call
    run_report
  end

  private

  def check_test_status
    @check_test_status ||= GetTestStatus.new(wpt_id: @report.wpt_id).call
  end

  def get_test_results
    @get_test_results ||= GetTestResults.new(wpt_id: @report.wpt_id).call
  end

  def complete_status_codes
    [200,400,404]
  end

  def test_complete?(status_code)
    complete_status_codes.include? status_code
  end

  def data?(data)
    !data.nil?
  end

  def run_report
    params = {
      status_code: @report.status_code,
      status: @report.status,
      data: @report.data
    }

    if test_complete?(params[:status_code]) && data?(params[:data])
      return false
    end

    unless test_complete?(params[:status_code])
      params[:status_code] = check_test_status[:status_code]
      params[:status] = check_test_status[:status]
    end

    if test_complete?(params[:status_code]) && !data?(params[:data])
      params = params.merge(get_test_results)
    end

    params
  end
end
