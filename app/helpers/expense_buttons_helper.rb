module ExpenseButtonsHelper
  def show_buttons(obj, expense)
    if obj == @grouped
      button_to 'Remove', expense_groups_path(expense: expense.id, group: @group.id), method: :post, data: { confirm: 'Are you sure?' }, class: "button is-small is-block"
    elsif obj == @ungrouped
      button_to 'Add', expense_groups_path(expense: expense.id, group: @group.id), method: :post, class: "button is-small is-block"
    end
  end
end
