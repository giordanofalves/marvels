require "rails_helper"

RSpec.describe ApplicationController, type: :controller do
  controller do
    def index; end
  end

  describe "#index" do
    before do
      get :index
      login_user
    end

    it "Should have a current_user" do
      expect(subject.current_user).not_to be_nil
    end

    it "Should have a nil current_user when sign_out" do
      logout_user(subject.current_user)
      expect(subject.current_user).to be_nil
    end

    it "Should redirect to login when not have a current_user", skip_before: true do
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
