class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  validates :full_url, :standard_url,
            :portrait_url, :landscape_url, presence: true
end
