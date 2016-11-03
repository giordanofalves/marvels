namespace :characters do
  desc "Import characters data from marvel api to Character model."

  task import_data: :environment do
    character_service = Marvel::Service::Character.new

    ("A".."Z").map do |char|
      response  = character_service.characters(char)
      total     = response["data"]["total"]

      create_characters(response["data"]["results"])

      if total > 100
        response = character_service.characters(char, 99)
        create_characters(response["data"]["results"])
      end
    end
  end
end

def create_characters(results)
  results.each do |result|
    character = check_if_new_character(result)
    if character
      character.character_id  = result["id"]
      character.name          = result["name"]
      character.description   = result["description"]
      character.url           = result["url"]
      character.modified_at   = result["modified"]
      character.image         = character_images(result)
      character.save
      puts I18n.t("general.tasks.characters.import.successful", character_name: result["name"])
    else
      puts I18n.t("general.tasks.characters.import.already_updated", character_name: result["name"])
    end
  end
end

def check_if_new_character(result)
  character = Character.find_by(character_id: result["id"])

  if character
    character_modified?(character, result["modified"])
  else
    Character.new
  end
end

def character_modified?(character, data_modified)
  (character.modified_at != data_modified) ? character : nil
end

def character_images(result)
  Image.new(
    full_url:      "#{result['thumbnail']['path']}.#{result['thumbnail']['extension']}",
    standard_url:  "#{result['thumbnail']['path']}/standard_xlarge.#{result['thumbnail']['extension']}",
    portrait_url:  "#{result['thumbnail']['path']}/portrait_xlarge.#{result['thumbnail']['extension']}",
    landscape_url: "#{result['thumbnail']['path']}/landscape_xlarge.#{result['thumbnail']['extension']}"
  )
end
