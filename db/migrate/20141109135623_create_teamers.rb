class CreateTeamers < ActiveRecord::Migration
  def change
    create_table :teamers do |t|
      t.string :firstname
      t.string :secondname
      t.string :text

      t.timestamps
    end
    add_attachment :teamers, :image

  end
end
