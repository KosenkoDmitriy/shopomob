class CreateGalleryProjects < ActiveRecord::Migration
  def change
    create_table :gallery_projects do |t|
      t.belongs_to :gallery #, index: true
      t.belongs_to :project #, index: true
      t.timestamps
    end
  end
end
