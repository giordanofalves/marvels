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

  def description(character)
    character.description.present? ? character.description : t("general.characters.description_not_found")
  end

  def comics_by_character(comics)
    comics.present? ? comics_list(comics) : t("general.characters.comics_not_found")
  end

  private

  def comics_list(comics)
    content_tag(:div, class: "comics-list") do
      comics.each do |comic|
        concat(image_tag(comic.image.portrait_url, class: "img-thumbnail"))
      end
    end
  end
end
