class DishesController < ApiController
  include Geokit::Geocoders
  include GeokitHelper
  geocode_ip_address

  def index
    @dishes = Dish.all
  end
end
