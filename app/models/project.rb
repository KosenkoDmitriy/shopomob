class Project < ActiveRecord::Base

  belongs_to :gallery
  accepts_nested_attributes_for :gallery

  translates :title, :subtitle, :text, :tags, :url
  active_admin_translates :title, :subtitle, :text, :tags, :url
  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true
end
