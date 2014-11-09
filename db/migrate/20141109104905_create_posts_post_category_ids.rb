class CreatePostsPostCategoryIds < ActiveRecord::Migration
  def change
    create_table :posts_post_category_ids do |t|
      t.belongs_to :post
      t.belongs_to :post_category
      t.timestamps
    end
  end
end
