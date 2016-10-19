require "rails_helper"

RSpec.describe CharactersController, type: :controller do
  before do
    login_user
    Timecop.freeze "2016-01-01T00:00:24+00:00"
  end

  after do
    Timecop.return
  end

  describe "#index", :vcr do
    it "assigns @character" do
      VCR.use_cassette("characters_controller/characters") do
        get :index
        expect(assigns(:character)).to be_an_instance_of(Character)
      end
    end

    it "renders the index template" do
      VCR.use_cassette("characters_controller/characters") do
        get :index
        expect(response).to render_template(:index)
      end
    end

    it "has a 200 status code" do
      VCR.use_cassette("characters_controller/characters") do
        get :index
        expect(response.status).to eq(200)
      end
    end
  end

  describe "#update_view", :vcr do
    letter = "S"

    it "assigns @character" do
      VCR.use_cassette("characters_controller/characters_witth_letter") do
        get :update_view, params: { letter: letter }
        expect(assigns(:character)).to be_an_instance_of(Character)
      end
    end

    it "renders the index template" do
      VCR.use_cassette("characters_controller/characters_witth_letter") do
        get :update_view, params: { letter: letter }
        expect(response).to render_template(:index)
      end
    end

    it "has a 200 status code" do
      VCR.use_cassette("characters_controller/characters_witth_letter") do
        get :update_view, params: { letter: letter }
        expect(response.status).to eq(200)
      end
    end
  end
end
