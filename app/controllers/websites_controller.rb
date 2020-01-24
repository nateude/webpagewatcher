class WebsitesController < AuthenticatedController
  include ApplicationHelper

  def index
    @websites = current_user.website.all
    @website = Website.new
  end

  def show
    @website = Website.find(params[:id])

    redirect_to index unless @website.user == current_user

    @profile = Profile.new
    @report = Report.new
  end

  def new
    @website = Website.new
  end

  def create
    @website = Website.new(website_params)
    if @website.save
      set_flash :success, 'Website Created: ' + @website.name
      redirect_to websites_path
    else
      handle_errors(@website)
      render 'new'
    end
  end

  private

  def website_params
    params.require(:website).permit(:name, :url, :user_id)
  end
end
