require "rails_helper"

RSpec.describe CharacterHelper, type: :helper do
  include Devise::Test::ControllerHelpers

  before do
    login_user
  end

  describe "#alphabetic_pagination" do
    it "return alphabetic list" do
      expect(helper.alphabetic_pagination).to match(/[ABCDEFGHIJKMNOPQRSTUVWXYZ]/)
    end

    it "return update_view_path" do
      expect(helper.alphabetic_pagination).to include(helper.update_view_path(("A".."Z").to_a.sample))
    end
  end

  describe "#description" do
    let(:character_with_description)     { build(:character) }
    let(:character_without_description)  { build(:character, description: nil) }

    it "return character description" do
      description = helper.description(character_with_description)
      expect(description).to eq(character_with_description.description)
    end

    it "don't return character description" do
      description = helper.description(character_without_description)
      expect(description).to eq(I18n.t("general.characters.description_not_found"))
    end
  end
end
