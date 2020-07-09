class ExpenseGroup < ApplicationRecord
  belongs_to :expense
  belongs_to :group
  validates :group_id, presence: true
  validates :expense_id, presence: true
end
