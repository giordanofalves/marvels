class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.integer :character_id, null: false
      t.string :name, null: false
      t.text :description
      t.string :url
      t.datetime :modified_at, null: false

      t.timestamps
    end
  end
end
