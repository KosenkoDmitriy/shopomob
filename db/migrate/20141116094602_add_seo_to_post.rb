class AddSeoToPost < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.references :seo
    end
    add_index :posts, :seo_id
    #add_index :posts, :slug, unique: true
  end
end
