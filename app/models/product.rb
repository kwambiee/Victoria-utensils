class Product < ApplicationRecord
    belongs_to :category
    belongs_to :brand, optional: true

    has_many :users, through: :wishlists

    scope :new_products, -> { where('created_at > ?', DateTime.current - 7) }
end
