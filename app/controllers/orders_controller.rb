class OrdersController < ApplicationController
  before_action :authenticate_user!

  def add_to_order
    @order = current_user.orders.find_by(finalized: false) || Order.create(user: current_user)
    dish = Dish.find(params[:dish_id])
    @order.add(dish, dish.price)
    flash[:notice] = "Successfully added to order"
    redirect_back(fallback_location: root_path)
  end
end
