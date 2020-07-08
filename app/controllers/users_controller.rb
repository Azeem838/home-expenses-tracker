class UsersController < ApplicationController
  def show
    @expenses = current_user.expenses.reverse.last(5).reverse
  end
end
