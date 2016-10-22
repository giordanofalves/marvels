module ApplicationHelper
  def home_link
    link_to(image_tag("m-icon"), root_path, class: "navbar-brand")
  end

  def separator(content)
    content_tag(:spam, content, class: "separator")
  end
end
