class Chmyuseridinvlan < ActiveRecord::Migration
  def up
		add_column :vlans, :domain_id, :integer 
		remove_column :vinos, :myuser_id
  end

  def down
		remove_column :vlans, :domain_id
		add_column :vinos, :myuser_id, :integer
  end
end
