class Buyingorder < ApplicationRecord
	has_many :orderitems, dependent: :destroy
end
