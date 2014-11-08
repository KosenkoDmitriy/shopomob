class Service < ActiveRecord::Base

  has_many :order_service_ids
  has_many :orders, through: :order_service_ids
  accepts_nested_attributes_for :orders, :allow_destroy => true

  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image, :allow_destroy => true
end
