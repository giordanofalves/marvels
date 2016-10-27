class Character < ActiveRecord::Base
  validates :name, :modified_at, presence: true

  has_one :image, as: :imageable

  def characters(letter="A", offset=0)
    service.response(service: "characters", letter: letter, offset: offset)
  end

  private

  def service
    Marvel::Service.new
  end
end
