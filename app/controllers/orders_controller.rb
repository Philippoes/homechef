class OrdersController < ApplicationController
	def create_buyingorder
		if @buyingorder != nil
			@buyingorder = Buyingorder.find_by(user: current_user)
		else
			@buyingorder = Buyingorder.create
		end
	end


	def create_sellingorder
		if @sellingorder != nil
			@sellingorder = Sellingorder.find_by(session: current_session)
		else
			@sellingorder = Sellingorder.create()
		end
	end


	def create
		Orderitem.create(pickup_time: Dishes.find(params[:id]).readytime, dish: Dishes.find(params[:id]), buyingorder: @buyingorder, sellingorder: @sellingorder)
		redirect_to root_path
		flash[:notice] = "Successfully added to order"
	end

end
