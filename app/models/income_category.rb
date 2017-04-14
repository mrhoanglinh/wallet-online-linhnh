class IncomeCategory < ApplicationRecord
  belongs_to :income
  belongs_to :category
end
