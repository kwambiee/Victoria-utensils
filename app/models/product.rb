class Product < ApplicationRecord
    belongs_to :category
    belongs_to :brand, optional: true

    has_many :wishlists
    has_many :users, through: :wishlists
    validates :title, :price, presence: true

    scope :new_products, -> { where('created_at > ?', DateTime.current - 7) }
end
