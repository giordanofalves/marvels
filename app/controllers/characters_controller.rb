class CharactersController < ApplicationController
  before_action :character

  def index
    render :index, locals: { characters: @character.characters }
  end

  def update_view
    render :index, locals: { characters: @character.characters(params[:letter]) }
  end

  private

  def character
    @character = Character.new
  end
end
