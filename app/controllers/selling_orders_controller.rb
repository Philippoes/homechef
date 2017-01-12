class SellingOrdersController < ApplicationController
	def create
		if @sellingorder != nil
			@sellingorder = Sellingorder.find_by(session: current_session)
		else
			@sellingorder = Sellingorder.create()
		end
	end
end
