class CreateVlans < ActiveRecord::Migration
  def change
    create_table :vlans do |t|
      t.integer :vlannumber
      t.string :address
      t.integer :bridgedomain
      t.string :gateway
      t.integer :vinos_id
      t.string :nearusel
      t.string :creator

      t.timestamps
    end
  end
end
