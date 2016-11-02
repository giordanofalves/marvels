class Character < ActiveRecord::Base
  has_one :image, as: :imageable

  validates :name, :character_id, :modified_at, presence: true

  scope :start_by, ->(letter="A") { where("name LIKE '#{letter}%'") }
end
