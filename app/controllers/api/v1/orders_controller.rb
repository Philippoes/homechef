class Api::V1::OrdersController < ApiController
  def create
    create_order
    dish = Dish.find(params[:dish_id])
    if dish.id/dish.id == 1
      @order.add(dish, dish.price)
      render json: {message: "Successfully added Pizza"}
    else
      render json: {message: "Something went wrong, you did not add a dish to your order"}
    end
  end

  private

  def create_order
    user = FactoryGirl.create(:user)
    @order = Order.create(user: user)
  end

end
