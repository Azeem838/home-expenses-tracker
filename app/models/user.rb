class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :expenses, class_name: 'Expense', foreign_key: 'author_id'
  has_many :user_groups
  has_many :groups
end
