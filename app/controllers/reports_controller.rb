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
  private

    def report_params
      params.require(:report).permit(:website_id, :profile_id, :wpt_id, :status)
    end
end

