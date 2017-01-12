class Dish < ApplicationRecord
  validates_presence_of :name, :description, :price, :ready_time, :portions, presence: true
  belongs_to :orderitem
end
