class AddImageToProject < ActiveRecord::Migration
  def change
    add_attachment :projects, :image
  end
end
