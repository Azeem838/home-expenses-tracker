class Group < ApplicationRecord
  has_many :expense_groups, dependent: :destroy
  has_many :expenses, through: :expense_groups
  belongs_to :user
  has_one_attached :main_image

  validates :name, uniqueness: { case_sensitive: false }, presence: true
  validate :acceptable_image

  scope :total, ->(g) { g.expenses.sum(:amount) }
  scope :order_alpha, -> { order('LOWER(name)') }

  def acceptable_image
    return unless main_image.attached?

    errors.add(:main_image, 'is too big') unless main_image.byte_size <= 1.megabyte

    acceptable_types = ['image/jpeg', 'image/png']
    errors.add(:main_image, 'must be a JPEG or PNG') unless acceptable_types.include?(main_image.content_type)
  end
end
