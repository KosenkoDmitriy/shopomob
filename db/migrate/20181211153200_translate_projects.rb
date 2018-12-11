class TranslateProjects < ActiveRecord::Migration
  def self.up
    Project.create_translation_table!({
      :url => :text,
      :title => :string,
      :subtitle => :string,
      :text => :text,
      :tags => :text
    }, {
      :migrate_data => true,
      # remove_source_columns: true
    })
  end

  def self.down
    Project.drop_translation_table! :migrate_data => true
  end
end

