class CreateExpenseGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :expense_groups do |t|
      t.references :expense, null: false, foreign_key: true, index: true
      t.references :group, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
