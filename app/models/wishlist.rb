class Wishlist < ApplicationRecord
    belongs_to :user
    belongs_to :product

    validates :user_id, :product_id, presence: true
    validates :user_id, uniqueness: { scope: :product_id }

    scope :wishlist_products, ->(user_id)  { joins(:product,:user).where(user_id: user_id).collect(&:product) }
end
