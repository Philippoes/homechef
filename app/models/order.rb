class Order < ApplicationRecord
  acts_as_shopping_cart_using :order_item
  belongs_to :user
  validates_presence_of :user, presence: true

  def taxes
    0
  end
end
