class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title
      t.text :text
      t.text :stext
      t.string :link
      t.decimal :price

      t.timestamps
    end
  end
end
