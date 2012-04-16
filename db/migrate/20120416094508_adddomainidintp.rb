class Adddomainidintp < ActiveRecord::Migration
  def up
		add_column :terminate_points, :domain_id, :integer 
  end

  def down
		remove_column :terminate_points, :domain_id
  end
end
