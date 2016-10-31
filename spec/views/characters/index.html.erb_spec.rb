require "rails_helper"
include CharacterHelper

RSpec.describe "characters/index.html.erb", type: :view do
  let(:character_1) { create(:character, :with_image) }
  let(:character_2) { create(:character, :with_image) }

  before do
    render template: "characters/index.html.erb",
           locals: { characters: [character_1, character_2] }
  end

  it "display title" do
    expect(rendered).to have_content(I18n.t("general.characters.title"))
  end

  it "display characters" do
    expect(rendered).to have_content(character_1.name)
    expect(rendered).to have_content(character_2.name)
  end

  it "display images" do
    expect(rendered).to include(character_1.image.standard_url.split("?").first)
    expect(rendered).to include(character_2.image.standard_url.split("?").first)
  end

  it "display links" do
    match1 = %r{<a href="\/characters\/#{character_1.id}">#{character_1.name}<\/a>}
    match2 = %r{<a href="\/characters\/#{character_2.id}">#{character_2.name}<\/a>}

    expect(rendered).to match(match1)
    expect(rendered).to match(match2)
  end
end
