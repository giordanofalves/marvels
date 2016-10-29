module Authentication
  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    sign_in user
  end

  def logout_user(user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_out user
  end

  def sign_in_helper(user)
    visit new_user_session_path

    fill_in :user_email,    with: user.email
    fill_in :user_password, with: user.password

    click_button I18n.t("devise.login")
  end
end

module DeviseHelpers
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
