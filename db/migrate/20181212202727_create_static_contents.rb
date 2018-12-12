class CreateStaticContents < ActiveRecord::Migration
  def change
    create_table :static_contents do |t|
      t.string :title
      t.string :subtitle
      t.text :text
      t.string :tags
      t.boolean :is_draft

      t.timestamps
    end
  end
end
