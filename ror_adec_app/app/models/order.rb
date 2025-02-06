class Order < ActiveRecord::Base
  belongs_to :customer

  has_many :order_service_ids
  has_many :services, through: :order_service_ids
  accepts_nested_attributes_for :services, :allow_destroy => true
  #has_many :services, dependent: :destroy

  accepts_nested_attributes_for :services, :allow_destroy => true
end
