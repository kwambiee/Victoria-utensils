require 'rails_helper'

RSpec.describe User, type: :model do
    subject { build(:user) }
    describe 'Validates presence of' do
        [:firstname, :lastname, :phone_number, :mailing_address, :email_address].each do |field|
            it { should validate_presence_of(field) }
        end
    end

    describe 'Validates uniqueness of' do
        [:email_address, :phone_number].each do |field|
            it { should validate_uniqueness_of(field) }
        end
    end

    describe 'Associations' do
        it { should have_many(:wishlists) }
        it { should have_many(:products).through(:wishlists) }
    end

end