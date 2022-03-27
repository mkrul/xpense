class AddCategoryIdToExpenses < ActiveRecord::Migration[6.0]
  def change
    add_reference :expenses, :category, index: true
  end
end
