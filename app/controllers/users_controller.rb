class UsersController < ApplicationController
  def show
    @expenses = current_user.expenses.last(5).reverse
  end
end
