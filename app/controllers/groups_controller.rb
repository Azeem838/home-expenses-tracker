class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
    expenses = Expense.grouped.created_by(current_user)
    @total = Expense.sum_expenses(expenses)
  end

  def show
    @group = Group.find(params[:id])
    @grouped = @group.expenses.order(created_at: :desc)
    @total = Group.total(@group)
    @ungrouped = Expense.ungrouped.created_by(current_user).last(5).reverse
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:notice] = 'Group was created successfully'
      redirect_to @group
    else
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = 'Group was successfully updated'
      redirect_to @group
    else
      render 'edit'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to all_groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
