class ReportsController < ApplicationController
  include ReportsHelper

  def index
    @reports = Report.all
    run_reports(@reports)
  end

  def new
    @report = Report.new
  end

  def show
    @report = Report.find(params[:id])

    return unless @report.status_code < 200

    report_update(@report)
    flash[:success] = 'Report Updated'
  end

  def update
    @report = Report.find(params[:id])
    report_update(@report)
    flash[:success] = 'Report ' + @report.wpt_id + ' Updated: '
    redirect_to(:back)
  end

  def destroy
    Report.find(params[:id]).destroy
    flash[:success] = 'Report deleted'
    redirect_to(:back)
  end

  def create
    @report = Report.new(report_params)
    if @report.valid?
      update_report_attr(@report)
      @report.save
      flash[:success] = 'Report Created'
      redirect_to @report
    else
      render 'new'
    end
  end

  def json
    report = Report.find(params[:id])
    render json: report.data
  end

  private

  def update_report_attr(report)
    wpt = wpt_init_request(report)
    report.update(
      wpt_id: wpt[:wpt_id],
      status_code: wpt[:status_code]
    )
  end

  def report_params
    params.require(:report).permit(:website_id, :profile_id, :wpt_id, :status, :status_code)
  end
end
