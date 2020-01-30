class PingbackController < ApplicationController
  def pingback
    report = Report.find_by(wpt_id: params[:id])
    data = CheckReport.new(report: report).call
    report.update!(data) if data
    render json: { status: true, id: report.id, update: report.updated_at }
  end
end
