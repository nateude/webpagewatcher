class DashboardController < ApplicationController
  def index
    @reports = Report.all
    @report = Report.new

    @websites = Website.all
    @website = Website.new
    
    @profiles = Profile.all
    @profile = Profile.new
  end

  def help; end
end
