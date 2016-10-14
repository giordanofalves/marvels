require "rails_helper"

describe CharactersController, type: :controller do
  before do
    login_user
  end

  describe "#index", :vcr do
    VCR.use_cassette("characters/characters_controller") do
      it "assigns @character" do
        get :index, locale: I18n.default_locale
        expect(assigns(:character)).to be_an_instance_of(Character)
      end

      it "renders the index template" do
        get :index, locale: I18n.default_locale
        expect(response).to render_template(:index)
      end

      it "has a 200 status code" do
        get :index, locale: I18n.default_locale
        expect(response.status).to eq(200)
      end
    end
  end

  describe "#update_view", :vcr do
    letter = ("A".."Z").to_a.sample
    VCR.use_cassette("characters_controller/characters") do
      it "assigns @character" do
        get :update_view, letter: letter, locale: I18n.default_locale
        expect(assigns(:character)).to be_an_instance_of(Character)
      end

      it "renders the index template" do
        get :update_view, letter: letter, locale: I18n.default_locale
        expect(response).to render_template(:index)
      end

      it "has a 200 status code" do
        get :update_view, letter: letter, locale: I18n.default_locale
        expect(response.status).to eq(200)
      end
    end
  end
end
