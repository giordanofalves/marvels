require "rails_helper"

RSpec.describe CharacterController, type: :controller do
  describe "#index" do
    before do
      login_user
      get :index
    end
  end
end
