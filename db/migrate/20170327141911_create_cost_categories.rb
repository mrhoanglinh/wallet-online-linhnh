class CreateCostCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :cost_categories do |t|
      t.references :cost, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
