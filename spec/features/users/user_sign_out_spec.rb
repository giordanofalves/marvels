require "rails_helper"

RSpec.describe "Sign out", type: :feature do
  describe "User is able to Sign Out" do
    before do
      Timecop.freeze "2016-01-01T00:00:24+00:00"
      sign_in_helper(create(:user))
    end

    after do
      Timecop.return
    end

    it "User is redirected to sign in page" do
      click_link I18n.t("devise.logout")

      expect(page).to have_content(I18n.t("devise.failure.unauthenticated"))
      expect(page).to have_content(I18n.t("general.welcome.links.about"))
      expect(page).to have_content(I18n.t("general.welcome.links.hows_work"))
    end
  end
end
