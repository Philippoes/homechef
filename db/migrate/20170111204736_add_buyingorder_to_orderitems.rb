class AddBuyingorderToOrderitems < ActiveRecord::Migration[5.0]
  def change
    add_reference :orderitems, :buyingorder, foreign_key: true
  end
end
