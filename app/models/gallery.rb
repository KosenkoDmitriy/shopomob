class Gallery < ActiveRecord::Base
  translates :title
  active_admin_translates :title

  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true

  # has_and_belongs_to_many :projects
  has_many :gallery_projects
  has_many :projects, through: :gallery_projects
  accepts_nested_attributes_for :gallery_projects, :allow_destroy => true

end
