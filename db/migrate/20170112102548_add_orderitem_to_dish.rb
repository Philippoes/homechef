class AddOrderitemToDish < ActiveRecord::Migration[5.0]
  def change
    add_reference :dishes, :orderitem, foreign_key: true
  end
end
