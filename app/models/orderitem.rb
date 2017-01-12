class Orderitem < ApplicationRecord
	belongs_to :buyingorder
	belongs_to :dish
end
