require 'rails_helper'

RSpec.describe Wishlist, type: :model do
  subject { build(:wishlist) }

  describe 'Validations' do
    [:user_id, :product_id].each do |field|
         it { should validate_presence_of(field) }
    end
  end

  describe 'Associations' do
    [:user, :product].each do |field|
      it { should belong_to(field) }
    end
  end
  
end
