class TranslateTeamers < ActiveRecord::Migration
  def self.up
    Teamer.create_translation_table!({
         :firstname => :string,
         :secondname => :string,
         :text => :text
     }, {
         :migrate_data => true
     })
  end

  def self.down
    Teamer.drop_translation_table! :migrate_data => true
  end
end
