class AddCanbebdFieldInVlan < ActiveRecord::Migration
  def up
		add_column :vlans, :canbebd, :boolean
  end

  def down
		remove_column :vlans, :canbebd
  end
end
