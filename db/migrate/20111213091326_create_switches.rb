class CreateSwitches < ActiveRecord::Migration
  def change
    create_table :switches do |t|
      t.string :address
      t.integer :swmodel_id

      t.timestamps
    end
  end
end
