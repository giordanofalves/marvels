module ApplicationHelper
  def home_link
    link_to(image_tag("m-icon"), root_path, class: "navbar-brand")
  end

  def separator(content)
    content_tag(:spam, content, class: "separator")
  end

  def back_link
    content_tag(:div, class: "back-link") do
      link_to t("general.project.back"), :back, class: "btn btn-info"
    end
  end
end
