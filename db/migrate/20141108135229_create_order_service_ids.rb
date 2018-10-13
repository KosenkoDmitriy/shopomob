class CreateOrderServiceIds < ActiveRecord::Migration
  def change
    create_table :order_service_ids do |t|
      t.belongs_to :order #, foreign_key: false
      t.belongs_to :service #, foreign_key: false
      t.timestamps
    end
  end
end
