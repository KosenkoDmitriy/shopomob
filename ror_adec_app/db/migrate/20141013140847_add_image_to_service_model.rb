class AddImageToServiceModel < ActiveRecord::Migration
  def change
    add_attachment :services, :image
  end
end
