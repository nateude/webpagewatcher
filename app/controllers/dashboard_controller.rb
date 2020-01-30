class DashboardController < ApplicationController
  def index
    if current_user && current_user.wpt_key.nil?
      render 'logged_in_no_key'
    elsif user_signed_in?
      @reports = current_user.report
      @report = Report.new

      @websites = current_user.website.all
      @website = Website.new

      @profiles = current_user.profile.all
      @profile = Profile.new

      render 'logged_in'
    else
      render 'logged_out'
    end
  end

  def help; end
end
