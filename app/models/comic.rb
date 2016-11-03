class Comic < ActiveRecord::Base
  has_one :image, as: :imageable
  has_and_belongs_to_many :characters

  validates :title, :comic_id, :modified_at, presence: true
end
