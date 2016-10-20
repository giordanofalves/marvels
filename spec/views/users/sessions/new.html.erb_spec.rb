require "rails_helper"

include UserHelper
include DeviseHelpers
include ApplicationHelper

RSpec.describe "users/sessions/new.html.erb", type: :view do
  before do
    render
  end

  it "displays general info" do
    expect(rendered).to have_content(t("general.welcome.title"))
    expect(rendered).to have_content(t("general.welcome.description"))
    expect(rendered).to have_content(t("devise.login"))
    expect(rendered).to have_content(t("devise.login_description"))
  end

  it "display login form" do
    expect(rendered).to have_field(:user_email)
    expect(rendered).to have_field(:user_password)
  end

  it "display links" do
    expect(rendered).to have_link(t("general.welcome.links.about"))
    expect(rendered).to have_link(t("general.welcome.links.hows_work"))
    expect(rendered).to have_link(t("devise.sign_up"))
    expect(rendered).to have_link(t("devise.facebook.login"))
    expect(rendered).to have_link(t("devise.sign_in.forgot_password?"))
  end
end
