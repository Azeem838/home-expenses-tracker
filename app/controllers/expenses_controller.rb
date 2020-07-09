class ExpensesController < ApplicationController
  def all_expenses
    @expenses = current_user.expenses.reverse
  end

  def all_external_expenses
    @expenses = Expense.ungrouped.created_by(current_user).reverse
  end

  def new
    @expense = Expense.new
    @groups = current_user.groups
  end

  def create
    @expense = current_user.expenses.build(expense_params)
    if @expense.save
      flash[:notice] = 'Expense was created successfully'
      redirect_to all_expenses_path
    else
      render 'new'
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, group_ids: [])
  end
end
