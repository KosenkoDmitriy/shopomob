class AddProjectsToGallery < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.belongs_to :gallery
    end
    add_index :projects, :gallery_id
  end
end
