class OrdersController < ApplicationController
	def create
		if @buyingorder != nil
			@buyingorder = Buyingorder.find_by(user: current_user)
		else
			@buyingorder = Buyingorder.create
		end
		if @sellingorder != nil
			@sellingorder = Sellingorder.find_by(session: current_session)
		else
			@sellingorder = Sellingorder.create()
		end
		Orderitem.create(pickup_time: Dish.find(params[:id]).readytime, dish: Dish.find(params[:id]), buyingorder: @buyingorder, sellingorder: @sellingorder)
		redirect_to root_path
		flash[:notice] = "Successfully added to order"
	end
end


