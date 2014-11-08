class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :comments

      t.timestamps
    end
    add_reference :orders, :customer, index: true
  end
end
