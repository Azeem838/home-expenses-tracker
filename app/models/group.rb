class Group < ApplicationRecord
  has_many :expense_groups, dependent: :destroy
  has_many :expenses, through: :expense_groups
  has_many :user_groups
  belongs_to :user
  validates :name, uniqueness: { case_sensitive: false }, presence: true
  has_one_attached :main_image
  validate :acceptable_image

  scope :total, ->(g) { g.expenses.sum(:amount) }

  def acceptable_image
    return unless main_image.attached?

    errors.add(:main_image, 'is too big') unless main_image.byte_size <= 1.megabyte

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(main_image.content_type)
      errors.add(:main_image, "must be a JPEG or PNG")
    end
  end
end
