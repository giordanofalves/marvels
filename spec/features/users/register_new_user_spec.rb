require "rails_helper"

RSpec.describe "Resgistration", type: :feature do
  describe "User can register yourself in Marvels" do
    let(:user) do
      double(:user, email: Faker::Internet.email, password: Faker::Internet.password(8))
    end

    before do
      visit new_user_registration_path
      Timecop.freeze "2016-01-01T00:00:24+00:00"
    end

    after do
      Timecop.return
    end

    it "User is redirected to sign in page" do
      VCR.use_cassette("characters_controller/characters") do
        fill_in :user_email,    with: user.email
        fill_in :user_password, with: user.password(8)
        fill_in :user_password_confirmation, with: user.password(8)

        click_button I18n.t("devise.sign_up")

        expect(page).to have_content(I18n.t("devise.registrations.signed_up"))
      end
    end
  end
end
