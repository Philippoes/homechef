class OrderitemsController < ApplicationController
  def create
    Orderitem.create(pickup_time: Dishes.find(params[id]).readytime, dish: Dishes.find(params[id]), buyingorder: @buyingorder, sellingorder: @sellingorder)
  end
end