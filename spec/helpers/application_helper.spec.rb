require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "#home_link" do
    it "Should return link of home project." do
      expect(helper.home_link).to include(t("general.project.title").upcase)
      expect(helper.home_link).to match(/<a class=(.*)href(.*)<\/a>$/)
    end
  end

  describe "#separator" do
    it "Should return link of home project." do
      expect(helper.separator("·")).to include("·")
      expect(helper.separator("")).to match(/^<spam class(.*)separator(.*)<\/spam>$/)
    end
  end
end
