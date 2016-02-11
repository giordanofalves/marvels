class Character
  def characters
    service.response("characters")
  end

  def character(id)
    service.response("character")
  end

  private

  def service
    service = Marvel::Service.new
  end
end
