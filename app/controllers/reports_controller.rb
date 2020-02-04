class ReportsController < AuthenticatedController
  include ApplicationHelper
  include ReportsHelper

  def index
    @reports = current_user.report.all
    @report = Report.new
  end

  def new
    @report = Report.new
  end

  def show
    @report = Report.find(params[:id])

    redirect_to index unless @report.user == current_user

    data = CheckReport.new(report: @report).call
    @report.update!(data) if data
  end

  def pingback
    report = Report.find_by(wpt_id: params[:id])
    data = CheckReport.new(report: report).call
    report.update!(data) if data
    render json: { status: true, id: report.id, update: report.updated_at }
  end

  def update
    report = Report.find(params[:id])
    data = CheckReport.new(report: report).call
    report.update!(data) if data

    set_flash :success, updated.to_s + ' report(s) updated'
    redirect_to action: show, id: params[:id]
  end

  def update_all
    reports = current_user.report.pending
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

  def run_all
    started = 0

    current_user.profile.each do |profile|
      report = Report.new(profile: profile)
      wpt = InitTest.new(url: report.profile.url, wpt_key: current_user.wpt_key).run
      report.update!(wpt)
      started += 1
    end

    set_flash :success, started.to_s + ' report(s) started'
    redirect_to(reports_path)
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
    params.require(:report).permit(:profile_id, :wpt_id, :status, :status_code)
  end
end
