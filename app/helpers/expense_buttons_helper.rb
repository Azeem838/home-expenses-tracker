module ExpenseButtonsHelper
  def show_buttons(obj, expense)
    if obj == @grouped
      link_to 'Remove', expense_group_path(expense: expense.id, group: @group.id), method: :delete, data: { confirm: 'Are you sure?' }
    elsif obj == @ungrouped
      link_to 'Add', expense_groups_path(expense: expense.id, group: @group.id), method: :post
    end
  end
end
