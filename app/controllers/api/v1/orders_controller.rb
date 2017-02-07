class Api::V1::OrdersController < ApiController
  def create
    create_order
    dish = Dish.find(params[:dish_id])
    @order.add(dish, dish.price)
    render json: {message: "Successfully added Pizza"}
  end

  private

  def create_order
    user = FactoryGirl.create(:user)
    @order = Order.create(user: user)
  end

end
