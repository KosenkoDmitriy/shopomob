class CreateServiceTarifs < ActiveRecord::Migration
  def change
    create_table :service_tarifs do |t|
      t.string :title
      t.text :text
      t.belongs_to :service

      t.timestamps
    end
  end
end
