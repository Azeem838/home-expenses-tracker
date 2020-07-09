class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def show
    @group = Group.find(params[:id])
    @expenses = @group.expenses
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

  private

  def group_params
    params.permit(:name)
  end
end
