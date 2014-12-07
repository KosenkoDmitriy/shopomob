class TranslatePosts < ActiveRecord::Migration
  def self.up
    Post.create_translation_table!({
       :slug => :string,
       :title => :string,
       :stext => :text,
       :text => :text,
       :tags => :string,
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Post.drop_translation_table! :migrate_data => true
  end
end
