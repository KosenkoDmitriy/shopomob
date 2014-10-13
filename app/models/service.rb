class Service < ActiveRecord::Base
  has_many :images, as: :imageable

  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image, :allow_destroy => true
end
