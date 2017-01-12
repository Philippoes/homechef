class BuyingorderlistsController < ApplicationController
  def create
    if @buyingorder != nil
      @buyingorder = Buyingorder.find_by(session: current_session)
    else
      @buyingorder = Buyingorder.create()
    end
  end
end
