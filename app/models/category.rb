class Category < ApplicationRecord
	has_many :cost_categories
	has_many :costs, :through => :cost_categories

	has_many :income_categories
	has_many :incomes, :through => :income_categories

	validates :name, uniqueness: true, presence: { message: "must be given please" }
end
