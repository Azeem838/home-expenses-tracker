require 'rails_helper'

RSpec.describe ExpenseGroup, type: :model do
  before { FactoryBot.build(:expense_group) }

  describe 'associations' do
    it { should belong_to(:expense) }
    it { should belong_to(:group) }
  end
end
