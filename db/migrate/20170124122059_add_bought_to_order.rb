class AddBoughtToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :bought, :boolean, :default => false
  end
end
