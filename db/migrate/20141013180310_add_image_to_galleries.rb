class AddImageToGalleries < ActiveRecord::Migration
  def change
    add_attachment :galleries, :image
  end
end
