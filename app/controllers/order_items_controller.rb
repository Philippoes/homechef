class OrderItemsController < ApplicationController
	def create
		Orderitem.create(pickup_time: Dishes.find(params[:id]).readytime, dish: Dishes.find(params[:id]), buyingorder: @buyingorder, sellingorder: @sellingorder)
		redirect_to root_path
		flash[:notice] = "Successfully added to order"
	end
end
