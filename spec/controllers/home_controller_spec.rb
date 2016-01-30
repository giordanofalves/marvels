require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "#index" do
    before do
      login_user
      get :index
    end
  end
end
