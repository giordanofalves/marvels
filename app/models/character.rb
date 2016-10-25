class Character < ActiveRecord::Base
  validates :name, :modified_at, presence: true

  def characters(letter="A")
    service.response(service: "characters", letter: letter)
  end

  private

  def service
    Marvel::Service.new
  end
end
