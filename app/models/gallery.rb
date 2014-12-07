class Gallery < ActiveRecord::Base
  translates :title
  active_admin_translates :title

  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true
end
