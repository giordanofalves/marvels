require "rails_helper"
include CharacterHelper

RSpec.describe "characters/show.html.erb", type: :view do
  let(:character) { create(:character, :with_image) }

  before do
    render template: "characters/show.html.erb",
           locals: { character: character }
  end

  it "display title" do
    expect(rendered).to have_content(I18n.t("general.characters.description"))
  end

  it "display character info" do
    expect(rendered).to have_content(character.name)
    expect(rendered).to have_content(character.description)
  end

  it "display image" do
    expect(rendered).to include(character.image.portrait_url.split("?").first)
  end
end
