class Character
  def characters(letter)
    service.response(service: "characters", letter: letter)
  end

  private

  def service
    service = Marvel::Service.new
  end
end
