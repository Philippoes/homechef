class CheckoutController < ApplicationController
  def index
    if Order.where(bought: false).count == 0 || Order.find_by(bought: false).shopping_cart_items.count == 0
      redirect_to root_path
      flash[:notice] = "You have no items in your order"
    else
      @order_items = Order.find_by(bought: false).shopping_cart_items
      @total_amount = Order.last.total
    end
  end

  def delete
    order = Order.last
    dish = Dish.find_by(id: params[:dish_id])
    order.remove(dish)
    flash[:notice] = "Removed dish from order"
    redirect_back(fallback_location: checkout_index_path)
  end
end
