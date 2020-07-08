class ExpensesController < ApplicationController
  def all_expenses
    @expenses = current_user.expenses
  end

  def all_external_expenses
    @expenses = Expense.external_expenses(current_user)
  end
end
