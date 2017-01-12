class CreateBuyingorders < ActiveRecord::Migration[5.0]
  def change
    create_table :buyingorders do |t|

      t.timestamps
    end
  end
end
