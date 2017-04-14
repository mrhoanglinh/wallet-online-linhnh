class CreateIncomeCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :income_categories do |t|
      t.references :income, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
