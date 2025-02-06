class CreatePostCategories < ActiveRecord::Migration
  def change
    create_table :post_categories do |t|
      t.string :title
      t.timestamps
    end
    add_column :post_categories, :posts, :has_many
  end
end
