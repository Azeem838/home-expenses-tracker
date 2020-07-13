require 'rails_helper'

RSpec.describe User, type: :model do
  before { FactoryBot.build(:user) }

  describe 'validations' do
    it 'should be invalid' do
      expect(FactoryBot.build(:user, email: nil)).not_to be_valid
    end

    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'associations' do
    it { should have_many(:expenses).dependent(:destroy) }
    it { should have_many(:groups).dependent(:destroy) }
  end
end
