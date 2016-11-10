require "rails_helper"

RSpec.describe UserHelper, type: :helper do
  describe "#logout_link" do
    it "return link logout." do
      login_user

      expect(helper.logout_link).to include(t("devise.logout"))
      expect(helper.logout_link).to match(%r{<a rel=(.*)href(.*)<\/a>$})
    end
  end

  describe "#shared_links_devise" do
    it "shared_links div." do
      expect(helper.shared_links_devise).to match(%r{^<div\s\w.*shared_links.>})
      expect(helper.shared_links_devise).to match(%r{<spam.*separator.*<\/spam>})
    end

    it "login link." do
      expect(helper.shared_links_devise).to include(t("devise.back_to_login"))
    end

    it "facebook login link." do
      expect(helper.shared_links_devise).to include(t("devise.facebook.login"))
    end

    it "registration link." do
      expect(helper.shared_links_devise).to include(t("devise.sign_up"))
    end

    it "reset password link." do
      expect(helper.shared_links_devise).to include(t("devise.sign_in.forgot_password?"))
    end
  end
end
