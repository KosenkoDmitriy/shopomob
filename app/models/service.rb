class Service < ActiveRecord::Base
  translates :title, :text, :stext, :link, :price
  active_admin_translates :title, :text, :stext, :link, :price

  has_many :order_service_ids
  has_many :orders, through: :order_service_ids
  accepts_nested_attributes_for :orders, :allow_destroy => true

  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image, :allow_destroy => true

  has_many :service_tarifs, dependent: :destroy
  accepts_nested_attributes_for :service_tarifs, :allow_destroy => true

end
