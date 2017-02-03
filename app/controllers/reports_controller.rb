class ReportsController < ApplicationController
  include ReportsHelper
  layout 'json', :only => :json

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
    wpt = wpt_check_status(@report.wpt_id)
    @report.update_attribute(:status, wpt)
    if(wpt = "Test Complete")
      wpt_data = wpt_get_data(@report.wpt_id)
      @report.update_attribute(:data, wpt_data)
    end
    flash[:success] = "Report Updated"
    redirect_to reports_path
  end

  def destroy
    Report.find(params[:id]).destroy
    flash[:success] = "Report deleted"
    redirect_to reports_path
  end

  def create

    new_report = report_params
    wpt = wpt_init_request(new_report)

    @report = Report.new(new_report.merge(wpt))
    if @report.save
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
      params.require(:report).permit(:website_id, :profile_id, :wpt_id, :status)
    end
end

