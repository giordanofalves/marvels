require "rails_helper"

RSpec.describe CharactersController, type: :controller do
  before do
    login_user
  end

  describe "#index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "#update_view" do
    letter = "S"

    it "renders the index template" do
      get :update_view, params: { letter: letter }
      expect(response).to render_template(:index)
    end

    it "has a 200 status code" do
      get :update_view, params: { letter: letter }
      expect(response.status).to eq(200)
    end
  end
end
