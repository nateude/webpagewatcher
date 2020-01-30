class AdminController < AuthenticatedController
  include AdminHelper
  before_action :admin_user!

  def index; end
end
