class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :expenses, class_name: 'Expense', foreign_key: 'author_id', dependent: :destroy
  has_many :groups, dependent: :destroy
end
