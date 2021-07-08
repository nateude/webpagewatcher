module AuthHelper
  # log in /  log out helpers
  def login_user
    login(FactoryBot.create(:user))
  end

  def login_admin
    login(FactoryBot.create(:user, :admin))
  end

  def login(user)
    request.session[:user_id] = user.id
  end

  def current_user
    User.find(request.session[:user_id])
  end

  def authenticate
    visit root_path
    fill_in 'session_email', with: FactoryBot.create(:user).email
    click_button 'Log In'
  end

  def authenticate_user(user)
    visit root_path
    fill_in 'session_email', with: user.email
    click_button 'Log In'
  end
end
