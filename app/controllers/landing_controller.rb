class LandingController < ApplicationController
  def index
    @dishes = Dish.all
  end

  def checkout
    @total_amount = Order.last.total
  end
end
