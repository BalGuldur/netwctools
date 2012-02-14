class CreateVlans < ActiveRecord::Migration
  def change
    create_table :vlans do |t|
      t.integer :vlanpvid
      t.boolean :used
      t.integer :vinos_id
      t.string :address
      t.string :descr

      t.timestamps
    end
  end
end
