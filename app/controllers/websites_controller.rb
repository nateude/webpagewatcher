class WebsitesController < ApplicationController

  def index
    @websites = Website.all
  end

  def show
    @website = Website.find(params[:id])
  end

  def new
    @website = Website.new
  end


  def create
    @website = Website.new(website_params)
    if @website.save
      flash[:success] = "Website Saved"
      redirect_to @website
    else
      render 'new'
    end
  end
  private

    def website_params
      params.require(:website).permit(:name, :url, :api_key)
    end
end
