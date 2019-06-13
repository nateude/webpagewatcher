class ReportsController < ApplicationController
  include ReportsHelper

  def index
    @reports = Report.all
  end

  def new
    @report = Report.new
  end

  def show
    @report = Report.find(params[:id])
    CheckTestStatus.new(report: @report).update unless @report.status_code == 200
    GetTestResults.new(report: @report).update if @report.data.nil? && @report.status_code == 200
  end

  def update; end

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
