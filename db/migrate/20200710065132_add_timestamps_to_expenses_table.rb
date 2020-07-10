class AddTimestampsToExpensesTable < ActiveRecord::Migration[6.0]
  def change
    add_column :expenses, :created_at, :timestamp
    add_column :expenses, :updated_at, :timestamp
  end
end
