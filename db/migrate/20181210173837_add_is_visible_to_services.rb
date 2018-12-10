class AddIsVisibleToServices < ActiveRecord::Migration
  def up
    add_column :services, :is_visible, :boolean, default: true
  end

  def down
    remove_column :services, :is_visible
  end
end
