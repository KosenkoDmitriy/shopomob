class AddOrderIdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :order_id, :integer, default: 999999 
  end
end
