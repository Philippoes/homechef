class CreateOrderitems < ActiveRecord::Migration[5.0]
  def change
    create_table :orderitems do |t|
      t.datetime :pickup_time

      t.timestamps
    end
  end
end
