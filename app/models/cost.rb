class Cost < ApplicationRecord
	has_many :cost_categories
	has_many :categories, :through => :cost_categories

	validates :amount, numericality: { :greater_than_or_equal_to => 0 }
end