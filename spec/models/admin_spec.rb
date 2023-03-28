require 'rails_helper'

RSpec.describe Admin, type: :model do
 subject { build(:admin) }

  describe 'Validates presence of' do
    it { should validate_presence_of(:email) }
  end
end
