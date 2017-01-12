class SellingorderController < ApplicationController
  def create
    if @sellingorder != nil do
      @sellingorder = Sellingorder.find_by(session: current_session)
    else
      @sellingorder = Sellingorder.create()
    end
  end
end
