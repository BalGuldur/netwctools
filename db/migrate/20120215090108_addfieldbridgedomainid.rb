class Addfieldbridgedomainid < ActiveRecord::Migration
  def up
		add_column :vlans, :bridgedomain_id, :integer
  end

  def down
		remove_column :vlans, :bridgedomain_id
  end
end
