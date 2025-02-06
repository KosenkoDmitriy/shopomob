class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :slug
      t.string :title
      t.text :stext
      t.text :text
      t.string :tags

      t.timestamps
    end
  end
end
