class CreateOrderServiceIds < ActiveRecord::Migration
  def change
    create_table :order_service_ids do |t|
      t.belongs_to :order
      t.belongs_to :service
      t.timestamps
    end
  end
end
