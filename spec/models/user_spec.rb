require "rails_helper"

RSpec.describe User, type: :model do
  describe "Should Respond" do
    it { should respond_to(:email) }
    it { should respond_to(:encrypted_password) }
    it { should respond_to(:reset_password_token) }
    it { should respond_to(:reset_password_sent_at) }
    it { should respond_to(:remember_created_at) }
    it { should respond_to(:created_at) }
    it { should respond_to(:created_at) }
    it { should respond_to(:name) }
    it { should respond_to(:provider) }
    it { should respond_to(:uid) }
  end

  describe "Validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe "Factory" do
    let(:user) { build(:user) }

    it { expect(user).to be_a User }
    it { expect(user).to be_valid }
  end
end
