class UsersController < ApplicationController
  def show
    @expenses = current_user.expenses.order(created_at: :desc).limit(5)
    @total = Expense.sum_expenses(@expenses)
  end
end
