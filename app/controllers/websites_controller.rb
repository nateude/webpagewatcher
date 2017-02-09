class WebsitesController < ApplicationController

  def index
    @websites = Website.all
  end

  def show
    @website = Website.find(params[:id])
    @profiles = Profile.where(website_id: params[:id])
    @reports = Report.where(website_id: params[:id]).take(5)
  end

  def new
    @website = Website.new
  end


  def create
    @website = Website.new(website_params)
    if @website.save
      flash[:success] = "Website Created: " + @website.name
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
