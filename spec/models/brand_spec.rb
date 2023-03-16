require 'rails_helper'

RSpec.describe Brand, type: :model do

  subject { build(:brand) }
  describe 'Validates presence of' do
    it { should validate_presence_of(:name) }
  end

  describe 'Validates uniqueness of' do
    it { should validate_uniqueness_of(:name) } 
  end

  describe 'Associations' do
    it { should have_many(:products) }
  end
end
