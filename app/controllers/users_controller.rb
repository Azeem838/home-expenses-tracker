class UsersController < ApplicationController
  def show
    @grand_total = current_user.expenses.sum(:amount)
    @groups = current_user.groups
    @ungrouped = current_user.expenses.ungrouped
    @total = Expense.sum_expenses(@ungrouped)
  end
end
