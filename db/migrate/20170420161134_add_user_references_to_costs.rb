class AddUserReferencesToCosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :costs, :user, foreign_key: true
  end
end
