class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    @order = Order.find(session[:order_id])
    @items = @order.shopping_cart_items
    @total_amount = @order.total
    @amount = @total_amount.to_i*100

    customer = Stripe::Customer.create(
        email: params[:stripeEmail],
        source: stripe_token(params)
    )

    charge = Stripe::Charge.create(
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'usd'
    )

    if charge.paid
      @order.update(finalized: true)
      session.delete :order_id
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to checkout_index_path
  end

  private
  def stripe_token(params)
    Rails.env.test? ? generate_test_token : params[:stripeToken]
  end

  def generate_test_token
    StripeMock.create_test_helper.generate_card_token
  end
end