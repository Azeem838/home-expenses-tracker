class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expense_groups, dependent: :destroy
  has_many :groups, through: :expense_groups, dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_float: true }
  validates :author_id, presence: true

  scope :created_by, ->(user) { where(author_id: user.id) }
  scope :ungrouped, -> { where.not(id: ExpenseGroup.where(expense_id: ids).pluck(:expense_id)) }
  scope :grouped, -> { where(id: ExpenseGroup.where(expense_id: ids).pluck(:expense_id)) }
  scope :sum_expenses, ->(ex) { ex.pluck(:amount).sum }
end
