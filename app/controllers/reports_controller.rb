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
  end

  def update
    @report = Report.find(params[:id])
    update = report_update(@report)
    flash[:success] = "Report "+@report.wpt_id+" Updated: "+update
    redirect_to(:back)
  end

  def destroy
    Report.find(params[:id]).destroy
    flash[:success] = "Report deleted"
    redirect_to(:back)
  end

  def create
    new_report = report_params
    wpt = wpt_init_request(new_report)
    @report = Report.new(new_report.merge(wpt))
    if @report.save
      if(@report.status_code == 200)
        wpt = wpt_check_status(@report.wpt_id)
        @report.update_attributes(
          status: wpt['statusText'],
          status_code: wpt['statusCode']
        )
      end
      flash[:success] = "Report Created"
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
    def report_params
      params.require(:report).permit(:website_id, :profile_id, :wpt_id, :status, :status_code)
    end
end

