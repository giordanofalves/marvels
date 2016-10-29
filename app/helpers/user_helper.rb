module UserHelper
  def logout_link
    link_to(t("devise.logout"), destroy_user_session_path, method: :delete) if user_signed_in?
  end

  def shared_links_devise
    content_tag(:div, class: :shared_links) do
      device_links.each do |link|
        concat(link_to(link[:name], link[:path]))
        next unless link != device_links.last
        concat(separator("·"))
      end
    end
  end

  private

  def device_links
    links = []

    if controller_name != "sessions"
      links << { name: t("devise.back_to_login"), path: new_session_path(resource_name) }
    end

    if devise_mapping.registerable? && controller_name != "registrations"
      links << { name: t("devise.facebook.login"), path: user_facebook_omniauth_authorize_path }
      links << { name: t("devise.sign_up"), path: new_registration_path(resource_name) }
    end

    if devise_mapping.recoverable? && controller_name != "passwords" && controller_name != "registrations"
      links << { name: t("devise.sign_in.forgot_password?"), path: new_password_path(resource_name) }
    end

    links
  end
end
