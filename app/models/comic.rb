class Comic < ActiveRecord::Base
  has_one :image, as: :imageable

  validates :title, :comic_id, :modified_at, presence: true
end
