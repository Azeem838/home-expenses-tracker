class Group < ApplicationRecord
  has_many :expense_groups
  has_many :expenses, through: :expense_groups
end
