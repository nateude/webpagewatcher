class WebsitesController < ApplicationController
  include ApplicationHelper

  def index
    @websites = Website.all
    @website = Website.new
  end

  def show
    @website = Website.find(params[:id])
    @profile = Profile.new
    @report = Report.new
  end

  def new
    @website = Website.new
  end

  def create
    @website = Website.new(website_params)
    if @website.save
      flash[:success] = 'Website Created: ' + @website.name
      redirect_to websites_path
    else
      render 'new'
    end
  end

  private

  def website_params
    params.require(:website).permit(:name, :url)
  end
end
