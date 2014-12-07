class TranslateServices < ActiveRecord::Migration
  def self.up
    Service.create_translation_table!({
      :title => :string,
      :text => :text,
      :stext => :text,
      :link => :string,
      :price => :string
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Service.drop_translation_table! :migrate_data => true
  end
end
