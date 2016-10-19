require "rails_helper"

RSpec.describe "Sign in", type: :feature do
  let(:allowed_user) { create(:user) }
  let(:disallowed_user) do
    double(:user, email: Faker::Internet.email, password: Faker::Internet.password(8))
  end

  describe "As a user I want to log in on Marvels" do
    before do
      visit new_user_session_path
      Timecop.freeze "2016-01-01T00:00:24+00:00"
    end

    after do
      Timecop.return
    end

    context "with valid login user data" do
      it "shows sucess flash message" do
        VCR.use_cassette("characters_controller/characters") do
          fill_in :user_email,    with: allowed_user.email
          fill_in :user_password, with: allowed_user.password

          click_button I18n.t("devise.login")

          expect(page).to have_content(I18n.t("devise.sessions.signed_in"))
        end
      end
    end

    context "with invalid login user data" do
      it "shows failure flash message" do
        VCR.use_cassette("characters_controller/characters") do
          fill_in :user_email,    with: disallowed_user.email
          fill_in :user_password, with: disallowed_user.password

          click_button I18n.t("devise.login")

          expect(page).to have_content(I18n.t("devise.failure.invalid"))
        end
      end
    end
  end
end
