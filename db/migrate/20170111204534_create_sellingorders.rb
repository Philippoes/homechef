class CreateSellingorders < ActiveRecord::Migration[5.0]
  def change
    create_table :sellingorders do |t|

      t.timestamps
    end
  end
end
