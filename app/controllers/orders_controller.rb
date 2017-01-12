class OrdersController < ApplicationController
	def create
		dish = Dish.find_by(id: params[:dish])
		if @buyingorder != nil
			@buyingorder = Buyingorder.last
		else
			@buyingorder = Buyingorder.create
		end
		if @sellingorder != nil
			@sellingorder = Sellingorder.last
		else
			@sellingorder = Sellingorder.create
    end
		Orderitem.create(pickup_time: dish.ready_time, dish: dish, buyingorder: @buyingorder, sellingorder: @sellingorder)
		redirect_to root_path
		flash[:notice] = "Successfully added to order"
	end
end


