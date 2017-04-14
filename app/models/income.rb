class Income < ApplicationRecord
	has_many :income_categories
	has_many :categories, :through => :income_categories

	validates :amount, numericality: { :greater_than_or_equal_to => 0 }
end
