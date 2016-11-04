namespace :comics do
  desc "Import comics data from marvel api to Comic model."

  task import_data: :environment do
    comic_service = Marvel::Service::Comic.new

    response = comic_service.comics
    total    = response["data"]["total"]
    create_comics(response["data"]["results"])

    (100..total).step(100) do |n|
      response = comic_service.comics(n)
      create_comics(response["data"]["results"])
    end
  end
end

def create_comics(results)
  results.each do |result|
    comic = check_if_news_comic(result)

    if comic
      comic.comic_id            = result["id"]
      comic.title               = result["title"]
      comic.number              = result["issueNumber"]
      comic.description         = result["description"]
      comic.variant_description = result["variant_description"]
      comic.pages               = result["pageCount"]
      comic.print_price         = prices(result["prices"], "printPrice")
      comic.digital_price       = prices(result["prices"], "digitalPrice")
      comic.on_sale             = dates(result["dates"], "onsaleDate")
      comic.modified_at         = result["modified"]
      comic.image               = images_comic(result)
      comic.characters          = characters(result) if result["characters"]["available"].nonzero?
      comic.save
      puts I18n.t("general.tasks.comics.import.successful", comic_title: result["title"])
    else
      puts I18n.t("general.tasks.comics.import.already_updated", comic_title: result["title"])
    end
  end
end

def check_if_news_comic(result)
  comic = Comic.find_by(comic_id: result["id"])

  if comic
    comic_modified?(comic, result["modified"])
  else
    Comic.new
  end
end

def comic_modified?(comic, data_modified)
  (comic.modified_at != data_modified) ? comic : nil
end

def images_comic(result)
  Image.new(
    full_url:      "#{result['thumbnail']['path']}.#{result['thumbnail']['extension']}",
    standard_url:  "#{result['thumbnail']['path']}/standard_xlarge.#{result['thumbnail']['extension']}",
    portrait_url:  "#{result['thumbnail']['path']}/portrait_xlarge.#{result['thumbnail']['extension']}",
    landscape_url: "#{result['thumbnail']['path']}/landscape_xlarge.#{result['thumbnail']['extension']}"
  )
end

def prices(prices, type, price=nil)
  prices.each do |p|
    next if p["type"] != type
    price = p["price"]
  end

  price
end

def dates(dates, type, date=nil)
  dates.each do |d|
    next if d["type"] != type
    date = d["date"]
  end

  date
end

def characters(result, characters=[])
  result["characters"]["items"].each do |character|
    id = character["resourceURI"].split("/").last
    characters << Character.find_by(character_id: id)
  end

  characters
end
