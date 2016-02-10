class CharacterController < ApplicationController
  before_action :character

  def index
    render :index, locals: { characters: @character.characters }
  end

  def show
    render :show, locals: { character: @character.character(id) }
  end

  private

  def character
    @character = Character.new
  end
end
