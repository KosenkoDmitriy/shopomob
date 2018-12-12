class Project < ActiveRecord::Base
  translates :title, :subtitle, :text, :tags, :url
  active_admin_translates :title, :subtitle, :text, :tags, :url
  
  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true

  # has_and_belongs_to_many :galleries
  has_many :gallery_projects
  has_many :galleries, through: :gallery_projects
  accepts_nested_attributes_for :gallery_projects, :allow_destroy => true
end
