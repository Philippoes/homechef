class LandingController < ApplicationController
  def index
    @dishes = Dish.all
  end

  def checkout
    @total_amount = 50
    # ShoppingCart.find_by(id: 1).shopping_cart_items.each do |shoppingcartitem|
    #   @totalamount += shoppingcartitem.item.price
    # end
  end
end
