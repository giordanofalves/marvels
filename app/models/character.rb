class Character < ActiveRecord::Base
  has_one :image, as: :imageable
  has_and_belongs_to_many :comics

  validates :name, :character_id, :modified_at, presence: true

  scope :start_by, ->(letter="A") { where("name LIKE '#{letter}%'") }
end
