class CreateWishlists < ActiveRecord::Migration[7.0]
  def change
    create_table :wishlists do |t|
      t.references :user, foreign_key: {to_table: :users }
      t.references :product,  foreign_key: {to_table: :products}

      t.timestamps
    end
  end
end
