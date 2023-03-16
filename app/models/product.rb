class Product < ApplicationRecord
    belongs_to :category
    belongs_to :brand, optional: true

    has_many :users, through: :wishlists
end
