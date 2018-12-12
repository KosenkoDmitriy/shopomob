class TranslateStaticContent < ActiveRecord::Migration
  def self.up
    StaticContent.create_translation_table!({
      title: :string,
      subtitle: :string,
      text: :text,
      tags: :string
    }, {
      migrate_data: true,
      remove_source_columns: true
    })
  end

  def self.down
    StaticContent.drop_translation_table! migrate_data: true
  end
end
