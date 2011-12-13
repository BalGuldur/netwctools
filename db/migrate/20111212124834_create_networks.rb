class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.string :networkaddress
      t.string :type

      t.timestamps
    end
  end
end
