class BuyingorderlistsController < ApplicationController
  def create
    if @buyingorder != nil
      @buyingorder = Buyingorder.find_by(user: current_user)
    else
      @buyingorder = Buyingorder.create
    end
  end
end
