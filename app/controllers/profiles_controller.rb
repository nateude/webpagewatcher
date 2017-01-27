class ProfilesController < ApplicationController

  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end


  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      flash[:success] = "Profile Saved"
      redirect_to @profile
    else
      render 'new'
    end
  end
  private

    def profile_params
      params.require(:profile).permit(:name, :website_id, :wpt_settings, :wpt_code, :interval, :api_key)
    end
end
