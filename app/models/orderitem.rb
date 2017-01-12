class Orderitem < ApplicationRecord
	belongs_to :buyingorder
	has_one :dish
end
