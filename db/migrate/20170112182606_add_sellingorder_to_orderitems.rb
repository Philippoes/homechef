class AddSellingorderToOrderitems < ActiveRecord::Migration[5.0]
  def change
    add_reference :orderitems, :sellingorder, foreign_key: true
  end
end
