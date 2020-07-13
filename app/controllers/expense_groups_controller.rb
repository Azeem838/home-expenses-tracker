class ExpenseGroupsController < ApplicationController
  before_action :set_group
  before_action :set_expense

  def create
    ExpenseGroup.create(expense_id: @expense.id, group_id: @group.id)
    flash[:notice] = "Expense #{@expense.name} was successfully added to #{@group.name}"
    redirect_to @group
  end

  def destroy
    expense_group = ExpenseGroup.where(expense_id: @expense.id, group_id: @group.id).first
    expense_group.destroy
    flash[:notice] = "#{@expense.name} was successfully removed from #{@group.name}"
    redirect_to @group
  end

  private

  def set_expense
    @expense = Expense.find(params[:expense])
  end

  def set_group
    @group = Group.find(params[:group])
  end
end
