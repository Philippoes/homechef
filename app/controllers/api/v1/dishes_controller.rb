class Api::V1::DishesController < ProjectApiController

  def index
    @dishes = Dish.all
  end
end
