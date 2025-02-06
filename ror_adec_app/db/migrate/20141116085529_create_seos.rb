class CreateSeos < ActiveRecord::Migration
  def change
    create_table :seos do |t|
      t.string :meta_title
      t.text :meta_description
      t.string :meta_keywords

      t.timestamps
    end
  end
end
