class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expense_groups
  has_many :groups, through: :expense_groups
  validates :name, presence: true
  validates :amount, presence: true
  scope :created_by, ->(user) { where(author_id: user.id) }
  scope :ungrouped, -> { where.not(id: ExpenseGroup.where(expense_id: ids).pluck(:expense_id)) }
end
