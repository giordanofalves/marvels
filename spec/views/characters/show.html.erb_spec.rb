require "rails_helper"
include ApplicationHelper
include CharacterHelper

RSpec.describe "characters/show.html.erb", type: :view do
  let(:character) { build_stubbed(:character, :with_image, :with_comics) }

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

  it "display black link" do
    expect(rendered).to include(t("general.project.back"))
  end

  it "display comics image" do
    random_image = character.comics.sample.image.portrait_url.split("?").first
    expect(rendered).to include(random_image)
  end
end
