class AddCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
    end
  end
end
