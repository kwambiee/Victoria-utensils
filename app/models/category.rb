class Category < ApplicationRecord
    has_many :products

    validates :title, :description, presence: true
    validates :title, uniqueness: true
end
