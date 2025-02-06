class PostCategory < ActiveRecord::Base
  #has_many :posts
  #accepts_nested_attributes_for :posts, :allow_destroy => true
  has_many :posts_post_category_ids
  has_many :posts, through: :posts_post_category_ids
  accepts_nested_attributes_for :posts, :allow_destroy => true
end
