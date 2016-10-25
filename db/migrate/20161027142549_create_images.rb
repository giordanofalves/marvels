class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :full_url
      t.string :standard_url
      t.string :portrait_url
      t.string :landscape_url
      t.references :imageable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
