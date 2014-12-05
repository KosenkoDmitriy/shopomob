class PostsPostCategoryId < ActiveRecord::Base
  belongs_to :post
  belongs_to :post_category
end
