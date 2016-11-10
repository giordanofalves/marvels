require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "#home_link" do
    it "Should return link of home project." do
      expect(helper.home_link).to include(t("general.project.title").upcase)
      expect(helper.home_link).to match(%r{<a class=(.*)href(.*)<\/a>$})
    end
  end

  describe "#separator" do
    it "Should return link of home project." do
      expect(helper.separator("·")).to include("·")
      expect(helper.separator("")).to match(%r{^<spam class(.*)separator(.*)<\/spam>$})
    end
  end

  describe "#back_link" do
    it "Should return link of a last page." do
      expect(helper.back_link).to include(t("general.project.back"))
      expect(helper.back_link).to match(%r{<a class=(.*)href(.*)<\/a>$})
    end
  end
end
