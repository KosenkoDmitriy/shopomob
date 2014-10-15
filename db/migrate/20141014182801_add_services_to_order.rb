class AddServicesToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :services, :has_many
  end
end
