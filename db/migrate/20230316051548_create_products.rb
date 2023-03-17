class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string "title", null: false
      t.string "image_url", array: true, default: []
      t.string "description"
      t.string "color", array: true, default: []
      t.float "price", null: false
      t.references :category, foreign_key: {to_table: :categories }
      t.references :brand, foreign_key: {to_table: :brands }, null: true

      t.timestamps
    end
  end
end

