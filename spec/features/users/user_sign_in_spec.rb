require "rails_helper"

RSpec.describe "Sign in", type: :feature do
  let(:allowed_user) { create(:user) }
  let(:disallowed_user) do
    double(:user, email: Faker::Internet.email, password: Faker::Internet.password(8))
  end

  describe "As a user I want to log in on Marvels" do
    before do
      visit new_user_session_path
    end

    context "with valid login user data" do
      it "shows sucess flash message" do
        fill_in :user_email,    with: allowed_user.email
        fill_in :user_password, with: allowed_user.password

        click_button I18n.t("devise.login")

        expect(page).to have_content(I18n.t("devise.sessions.signed_in"))
      end
    end

    context "with invalid login user data" do
      it "shows failure flash message" do
        fill_in :user_email,    with: disallowed_user.email
        fill_in :user_password, with: disallowed_user.password

        click_button I18n.t("devise.login")

        expect(page).to have_content(I18n.t("devise.failure.invalid"))
      end
    end
  end

  describe "As a user I want to log use facebook credentials on Marvels" do
    before do
      visit new_user_session_path
    end

    context "with valid login user data" do
      it "shows sucess flash message" do
        set_omniauth
        click_link I18n.t("devise.facebook.login")

        expect(page).to have_content(I18n.t("devise.omniauth_callbacks.success",
                                            kind: "Facebook"))
      end
    end

    context "with invalid login user data" do
      it "shows failure flash message" do
        set_invalid_omniauth
        click_link I18n.t("devise.facebook.login")

        expect(page).to have_content(I18n.t("devise.omniauth_callbacks.failure",
                                            kind: "Facebook", reason: "Invalid credentials"))
      end
    end
  end
end
