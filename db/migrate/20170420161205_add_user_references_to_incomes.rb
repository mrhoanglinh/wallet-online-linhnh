class AddUserReferencesToIncomes < ActiveRecord::Migration[5.0]
  def change
    add_reference :incomes, :user, foreign_key: true
  end
end
