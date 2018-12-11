class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :subtitle
      t.text :text
      t.text :tags
      t.text :url
      t.boolean :is_draft

      t.timestamps
    end
  end
end
