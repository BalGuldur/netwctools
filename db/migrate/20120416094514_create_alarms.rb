class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms do |t|
      t.string :description
      t.string :creator
      t.string :editor
      t.boolean :enable

      t.timestamps
    end
  end
end
