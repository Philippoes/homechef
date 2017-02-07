class Api::V1::DishesController < ProjectApiController

  def index
    @dishes = Dish.all
    render json: {entries: @dishes}
  end
end
