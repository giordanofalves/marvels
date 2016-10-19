require "rails_helper"

include UserHelper
include DeviseHelpers
include ApplicationHelper

RSpec.describe "users/registrations/new.html.erb", type: :view do
  before do
    render
  end

  it "display login form" do
    expect(rendered).to have_field(:user_email)
    expect(rendered).to have_field(:user_password)
    expect(rendered).to have_field(:user_password_confirmation)
  end

  it "display links" do
    expect(rendered).to have_link(t("devise.back_to_login"))
  end
end
