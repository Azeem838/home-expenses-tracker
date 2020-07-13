module AuthorHelper
  def author_of_expense(expense, obj)
    "by #{expense.author.username}," if obj == @grouped
  end
end
