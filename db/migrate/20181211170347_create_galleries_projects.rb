class CreateGalleriesProjects < ActiveRecord::Migration
  def up
    create_table :galleries_projects do |t| #, id: false do |t|
      t.belongs_to :gallery #, index: true
      t.belongs_to :project #, index: true
    end
  end

  def down
    drop_table :galleries_projects
  end
end
