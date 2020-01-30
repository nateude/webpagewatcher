module AdminHelper
  def admin_user!
    redirect_to root_path unless admin_user?
  end

  def admin_user?
    current_user.admin
  end
end
