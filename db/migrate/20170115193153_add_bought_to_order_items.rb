class AddBoughtToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :bought, :boolean, :default => false
  end
end
