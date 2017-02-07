class Api::V1::OrdersController < ApiController
  def create
    create_order
    begin
      dish = Dish.find(params[:dish_id])
    rescue ActiveRecord::RecordNotFound
      render json: { message: "Something went wrong, you did not add a dish to your order" }, status: :unprocessable_entity and return
    end
    @order.add(dish, dish.price)
    render json: {message: "Successfully added Pizza"}, status: :ok
  end

  private

  def create_order
    user = FactoryGirl.create(:user)
    @order = Order.create(user: user)
  end
end
