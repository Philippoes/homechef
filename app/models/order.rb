class Order < ApplicationRecord
  acts_as_shopping_cart_using :order_item
  validates_presence_of :user, presence: true
  belongs_to :user

  def taxes
    0
  end
end
