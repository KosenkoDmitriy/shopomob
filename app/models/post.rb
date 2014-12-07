class Post < ActiveRecord::Base
  translates :title, :text, :stext, :slug, :tags
  active_admin_translates :title, :text, :stext, :slug, :tags do
    validates_presence_of :title
  end

  belongs_to :seo
  # следующая строка указывает на вложенность формы seo в page
  accepts_nested_attributes_for :seo, :allow_destroy => true#, :reject_if => :all_blank

  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true

  has_many :posts_post_category_ids
  has_many :post_categories, through: :posts_post_category_ids
  accepts_nested_attributes_for :post_categories, :allow_destroy => true
end
