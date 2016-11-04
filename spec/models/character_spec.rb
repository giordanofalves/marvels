require "rails_helper"

RSpec.describe Character, type: :model do
  describe "Should Respond" do
    it { should respond_to(:character_id) }
    it { should respond_to(:name) }
    it { should respond_to(:description) }
    it { should respond_to(:url) }
    it { should respond_to(:modified_at) }
    it { should respond_to(:created_at) }
    it { should respond_to(:updated_at) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:modified_at) }
  end

  describe "Associations" do
    it { should have_one :image }
    it { have_and_belong_to_many :characters }
  end

  describe "Factory" do
    let(:character) { build(:character) }

    it { expect(character).to be_a Character }
    it { expect(character).to be_valid }
  end
end
