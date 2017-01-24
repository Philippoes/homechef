class RemoveBoughtFromOrderItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :order_items, :bought, :boolean
  end
end
