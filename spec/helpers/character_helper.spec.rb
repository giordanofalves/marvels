require "rails_helper"

RSpec.describe CharacterHelper, type: :helper do
  include Devise::Test::ControllerHelpers

  before do
    login_user
  end

  describe "#alphabetic_pagination" do
    it "return alphabetic list." do
      expect(helper.alphabetic_pagination).to match(/[ABCDEFGHIJKMNOPQRSTUVWXYZ]/)
    end

    it "return update_view_path." do
      expect(helper.alphabetic_pagination).to include(helper.update_view_path(("A".."Z").to_a.sample))
    end
  end
end
