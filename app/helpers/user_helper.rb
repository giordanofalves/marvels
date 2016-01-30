module UserHelper
  def logout_link
    if user_signed_in?
      link_to(t("devise.logout"), destroy_user_session_path, :method => :delete)
    end
  end

  def shared_links_devise
    content_tag(:div, class: :shared_links) do
      if controller_name != 'sessions'
        concat(link_to(t("devise.back_to_login"), new_session_path(resource_name)))
      end

      if devise_mapping.registerable? && controller_name != 'registrations'
        concat(link_to(t("devise.facebook.login"), user_omniauth_authorize_path(:facebook)))
        concat(link_to(t("devise.sign_up"), new_registration_path(resource_name)))
      end

      if devise_mapping.recoverable? && controller_name != 'passwords' && controller_name != 'registrations'
        concat(link_to(t("devise.sign_in.forgot_password?"), new_password_path(resource_name)))
      end
    end
  end
end
