require "rails_helper"
describe CharactersController, type: :controller do
  render_views

  before do
    login_user
  end

  describe "#index" do
    it "renders the index template" do
      get :index

      response.should contain("Listing widgets")
    end
  end
end
