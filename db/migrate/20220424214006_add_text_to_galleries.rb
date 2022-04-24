class AddTextToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :text, :text
  end
end
