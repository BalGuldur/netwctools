class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms do |t|
      t.string :voiceansw
      t.string :comment
      t.string :creator
      t.string :editor

      t.timestamps
    end
  end
end
