require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { build(:category) }
  describe 'Validates presence of' do
    [:title, :description].each do |field|
        it { should validate_presence_of(field) }
    end
  end

  describe 'Validates uniqueness of' do
    it { should validate_uniqueness_of(:title) } 
  end

  describe 'Associations' do
    it { should have_many(:products) }
  end
end
