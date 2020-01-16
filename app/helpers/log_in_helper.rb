module LogInHelper
  def resource_name
    :user
  end

  def resource
    User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    Devise.mappings[:user]
  end
end
