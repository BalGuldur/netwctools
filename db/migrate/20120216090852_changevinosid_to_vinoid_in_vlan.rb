class ChangevinosidToVinoidInVlan < ActiveRecord::Migration
  def up
		remove_column :vlans, :vinos_id
		add_column :vlans, :vino_id, :integer
  end

  def down
		remove_column :vlans, :vino_id
		add_column :vlans, :vinos_id, :integer
  end
end
