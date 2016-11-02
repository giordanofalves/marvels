class CreateComics < ActiveRecord::Migration[5.0]
  def change
    create_table :comics do |t|
      t.integer :comic_id, null: false
      t.string :title, null: false
      t.integer :number
      t.text :description
      t.text :variant_description
      t.integer :pages
      t.float :print_price
      t.float :digital_price
      t.datetime :on_sale
      t.datetime :modified_at, null: false

      t.timestamps
    end
  end
end
