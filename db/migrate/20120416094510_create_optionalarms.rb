class CreateOptionalarms < ActiveRecord::Migration
  def change
    create_table :optionalarms do |t|
      t.integer :position
      t.string :filename
      t.string :description

      t.timestamps
    end
  end
end
