class ExpensesController < ApplicationController
  def all_expenses
    @expenses = current_user.expenses
  end

  def all_external_expenses
    @expenses = Expense.ungrouped.created_by(current_user)
  end
end
