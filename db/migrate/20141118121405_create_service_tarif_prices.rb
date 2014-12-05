class CreateServiceTarifPrices < ActiveRecord::Migration
  def change
    create_table :service_tarif_prices do |t|
      t.float :price
      t.float :condition1
      t.float :condition2
      t.belongs_to :service_tarif
      t.timestamps
    end
  end
end
