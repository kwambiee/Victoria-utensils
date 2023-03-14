class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string "title", null: false
      t.string "image_url"
      t.string "description"
      t.float "price", null: false
      t.references :category, foreign_key: {to_table: :categories }

      t.timestamps
    end
  end
end
