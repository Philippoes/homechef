class Api::V1::OrdersController < ApiController
  def create
    render json: {message: "Successfully added Pizza"}
  end
end
