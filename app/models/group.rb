class Group < ApplicationRecord
  has_many :expense_groups
  has_many :expenses, through: :expense_groups
  has_many :user_groups
  belongs_to :user

  validates :name, uniqueness: { case_sensitive: false }
end
