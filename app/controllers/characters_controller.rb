class CharactersController < ApplicationController
  def index
    render :index, locals: { characters: Character.start_by("A") }
  end

  def update_view
    render :index, locals: { characters: Character.start_by(params[:letter]) }
  end

  def show
    render :show, locals: { character: Character.find(params[:id]) }
  end
end
