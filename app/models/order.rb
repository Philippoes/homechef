class Order < ApplicationRecord
  acts_as_shopping_cart_using :order_item

  def taxes
    0
  end
end
