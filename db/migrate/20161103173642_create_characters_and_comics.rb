class CreateCharactersAndComics < ActiveRecord::Migration[5.0]
  def change
    create_table :characters_comics, id: false do |t|
      t.belongs_to :character, index: true
      t.belongs_to :comic, index: true
    end
  end
end
