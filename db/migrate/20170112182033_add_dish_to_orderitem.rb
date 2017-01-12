class AddDishToOrderitem < ActiveRecord::Migration[5.0]
  def change
    add_reference :orderitems, :dish, foreign_key: true
  end
end
