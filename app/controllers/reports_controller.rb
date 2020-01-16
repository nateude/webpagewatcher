class ReportsController < AuthenticatedController
  include ApplicationHelper
  include ReportsHelper

  def index
    @reports = Report.all
    @report = Report.new
  end

  def new
    @report = Report.new
  end

  def show
    @report = Report.find(params[:id])

    data = CheckReport.new(report: @report).call
    @report.update!(data) if data
  end

  def update; end

  def update_all
    reports = Report.pending
    updated = 0

    reports.each do |report|
      data = CheckReport.new(report: report).call
      if data
        report.update!(data)
        updated += 1
      end
    end

    set_flash :success, updated.to_s + ' report(s) updated'

    redirect = params[:profile] ? profile_path(params[:profile]) : reports_path
    redirect_to(redirect)
  end

  def destroy
    Report.find(params[:id]).destroy
    set_flash :success, 'Report deleted'
    redirect_to(reports_path)
  end

  def create
    report = Report.new(report_params)

    if report.valid? & report.profile.report.pending.empty?
      wpt = InitTest.new(url: report.profile.url, wpt_key: current_user.wpt_key).run
      report.update!(wpt)
    elsif !report.profile.report.pending.empty?
      set_flash :error, 'Please wait till pending reports have completed'
    else
      handle_errors(report)
    end

    redirect_to profile_path(report.profile.id)
  end

  def json
    report = Report.find(params[:id])
    render json: report.data
  end

  private

  def report_params
    params.require(:report).permit(:website_id, :profile_id, :wpt_id, :status, :status_code)
  end
end
