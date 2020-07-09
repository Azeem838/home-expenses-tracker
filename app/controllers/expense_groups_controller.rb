class ExpenseGroupsController < ApplicationController
  def create
    @group = Group.find(params[:group])
    @expense = Expense.find(params[:expense])
    @expense_group = ExpenseGroup.create(expense_id: @expense.id, group_id: @group.id)
    flash[:notice] = "Expense #{@expense.name} was successfully added to #{@group.name}"
    redirect_to @group
  end
end
