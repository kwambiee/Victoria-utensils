require 'rails_helper'

RSpec.describe Product, type: :model do
    subject { build(:product) }
    describe 'Validates presence of' do
        [:title, :price].each do |field|
            it { should validate_presence_of(field) }
        end
    end

    describe 'Associations' do
        it { should belong_to(:category) }
        it { should have_many(:users).through(:wishlists) }
    end
  
end
