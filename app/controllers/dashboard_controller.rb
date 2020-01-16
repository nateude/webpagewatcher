class DashboardController < ApplicationController
  def index
    if user_signed_in?
      @reports = Report.all
      @report = Report.new

      @websites = Website.all
      @website = Website.new

      @profiles = Profile.all
      @profile = Profile.new

      render 'logged_in'
    else
      render 'logged_out'
    end
  end

  def help; end
end
