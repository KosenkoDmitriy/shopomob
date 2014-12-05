class ServiceTarif < ActiveRecord::Base
  belongs_to :service

  has_many :service_tarif_prices, dependent: :destroy
  accepts_nested_attributes_for :service_tarif_prices, :allow_destroy => true
end
