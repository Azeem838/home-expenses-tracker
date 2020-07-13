require 'rails_helper'

RSpec.describe Expense, type: :model do
  before { FactoryBot.build(:expense) }

  describe 'validations' do
    it 'should be invalid' do
      expect(FactoryBot.build(:expense, amount: nil)).not_to be_valid
    end

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:author_id) }
    it { should validate_numericality_of(:amount) }
  end

  describe 'associations' do
    it { should have_many(:expense_groups).dependent(:destroy) }
    it { should have_many(:groups).dependent(:destroy) }
    it { should belong_to(:author) }
  end
end
