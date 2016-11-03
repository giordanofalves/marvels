require "rails_helper"

RSpec.describe Comic, type: :model do
  describe "Should Respond" do
    it { should respond_to(:comic_id) }
    it { should respond_to(:title) }
    it { should respond_to(:number) }
    it { should respond_to(:description) }
    it { should respond_to(:variant_description) }
    it { should respond_to(:pages) }
    it { should respond_to(:print_price) }
    it { should respond_to(:digital_price) }
    it { should respond_to(:on_sale) }
    it { should respond_to(:modified_at) }
    it { should respond_to(:created_at) }
    it { should respond_to(:updated_at) }
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:comic_id) }
    it { should validate_presence_of(:modified_at) }
  end

  describe "Associations" do
    it { should have_one :image }
    it { have_and_belong_to_many :comics }
  end

  describe "Factory" do
    let(:comic) { build(:comic) }

    it { expect(comic).to be_a Comic }
    it { expect(comic).to be_valid }
  end
end
