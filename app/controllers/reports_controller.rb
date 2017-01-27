class ReportsController < ApplicationController

  def index
    @reports = Report.all
  end

  def new
    @report = Report.new
  end


  def create
    @report = Report.new(report_params)
    if @report.save
      flash[:success] = "Report data saved"
      redirect_to reports_path
    else
      render 'new'
    end
  end
  private

    def report_params
      params.require(:report).permit(:website_id, :profile_id, :wpt_id, :status, :data)
    end
end

