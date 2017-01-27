class CheckoutController < ApplicationController
  before_action :authenticate_user!

  def index
    @order = current_user.orders.find_by(finalized: false)

    if @order == nil || @order.shopping_cart_items.count == 0
      redirect_to root_path
      flash[:notice] = "You have no items in your order"
    else
      @order_items = @order.shopping_cart_items
      @total_amount = @order.total
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
