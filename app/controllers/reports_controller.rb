class ReportsController < ApplicationController
  include ApplicationHelper
  include ReportsHelper

  def index
    @reports = Report.all
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

    flash[:notice] = updated.to_s + " reports updated"
    redirect_to(reports_path)
  end

  def destroy
    Report.find(params[:id]).destroy
    flash[:success] = 'Report deleted'
    redirect_to(reports_path)
  end

  def create
    report = Report.new(report_params)

    if report.valid?
      wpt = InitTest.new(url: report.profile.url).run
      report.update!(wpt)

      report.save
      redirect_to report_path(report.id)
    else
      handle_errors(report)
      render 'new'
    end
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
