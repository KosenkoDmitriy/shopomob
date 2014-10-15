class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.text :details
      t.boolean :is_offer

      t.timestamps
    end
  end
end
