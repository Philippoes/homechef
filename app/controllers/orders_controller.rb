class OrdersController < ApplicationController
  def add_to_order
    @order = Order.find_by(finalized: false) || Order.create
    dish = Dish.find(params[:dish_id])
    @order.add(dish, dish.price)
    flash[:notice] = "Successfully added to order"
    redirect_back(fallback_location: root_path)
  end
end
