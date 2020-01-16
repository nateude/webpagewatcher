class ProfilesController < AuthenticatedController
  include ApplicationHelper

  def index
    @profiles = Profile.all
    @profile = Profile.new
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
      set_flash :success, 'New profile created: ' + @profile.name
      redirect_to profiles_path
    else
      handle_errors(@profile)
      render 'new'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :website_id, :wpt_settings, :wpt_code, :interval, :url)
  end
end
