module CharacterHelper
  def alphabetic_pagination
    return unless user_signed_in?

    content_tag(:div, class: "btn-toolbar") do
      content_tag(:div, class: "btn-group btn-group-sm") do
        ("A".."Z").map do |letter|
          concat(link_to(letter, update_view_path(letter),
                         class: "btn btn-default"))
        end
      end
    end
  end
end
