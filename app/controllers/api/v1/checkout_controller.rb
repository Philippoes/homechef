class Api::V1::CheckoutController < ApiController
  before_action :authenticate_api_v1_user!

  def index
    user = current_api_v1_user
    @order = user.orders.where(finalized: false).last
    if @order == nil || @order.shopping_cart_items.count == 0
      render json: { message: "You have no dishes in your order" }, status: :error
    else
      @order_items = @order.shopping_cart_items
      @total_amount = @order.total.to_f
      render 'show'
    end
  end
end
