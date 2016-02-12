module ApplicationHelper
  def home_link
    link_to t("general.project.title").upcase, root_path, class: "navbar-brand"
  end

  def separator(content)
    content_tag(:spam, content, class: "separator")
  end

  def alphabetic_pagination
    if user_signed_in?
      content_tag(:div, class: "btn-toolbar") do
        content_tag(:div, class: "btn-group btn-group-sm") do
          ("A".."Z").map do |letter|
            concat(link_to letter, update_view_path(letter),
                            class: "btn btn-default")
          end
        end
      end
    end
  end
end
