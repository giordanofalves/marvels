require "rails_helper"

RSpec.describe Image, type: :model do
  describe "Should Respond" do
    it { should respond_to(:full_url) }
    it { should respond_to(:standard_url) }
    it { should respond_to(:portrait_url) }
    it { should respond_to(:landscape_url) }
    it { should respond_to(:imageable) }
    it { should respond_to(:created_at) }
    it { should respond_to(:updated_at) }
  end

  describe "Validations" do
    it { should validate_presence_of(:full_url) }
    it { should validate_presence_of(:standard_url) }
    it { should validate_presence_of(:portrait_url) }
    it { should validate_presence_of(:landscape_url) }
  end

  describe "Associations" do
    it { should belong_to(:imageable) }
  end

  describe "Factory" do
    let(:image) { build(:image) }

    it { expect(image).to be_a Image }
    it { expect(image).to be_valid }
  end
end
