class ChargesController < ApplicationController
  def new
  end

  def create
    if Order.where(finalized: false)
      Order.find_by(finalized: false).update(finalized: true)
    end

    @items = Order.last.shopping_cart_items
    @total_amount = Order.last.total
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
