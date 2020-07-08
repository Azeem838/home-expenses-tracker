class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def show
    @group = Group.find(params[:id])
    @expenses = @group.expenses
  end

  def new; end
end
