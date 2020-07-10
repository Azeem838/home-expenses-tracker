class UsersController < ApplicationController
  def show
    @grand_total = current_user.expenses.sum(:amount)
    @groups = current_user.groups
  end
end
