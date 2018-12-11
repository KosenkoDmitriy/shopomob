class Gallery < ActiveRecord::Base
  translates :title
  active_admin_translates :title

  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true

  has_and_belongs_to_many :projects
  accepts_nested_attributes_for :projects#, :allow_destroy => true

end
