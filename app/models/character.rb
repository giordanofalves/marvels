class Character
  def characters(letter="A")
    service.response(service: "characters", letter: letter)
  end

  private

  def service
    Marvel::Service.new
  end
end
