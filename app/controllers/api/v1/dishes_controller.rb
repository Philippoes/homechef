class DishesController < ProjectApiController

  def index
    @dishes = Dish.all
  end
end
