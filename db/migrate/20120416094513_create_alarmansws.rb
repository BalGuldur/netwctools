class CreateAlarmansws < ActiveRecord::Migration
  def change
    create_table :alarmansws do |t|
      t.string :name
      t.string :description
      t.integer :gralarmansw_id

      t.timestamps
    end
  end
end
