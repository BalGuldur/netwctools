class Adddomainidinuser < ActiveRecord::Migration
  def up
		add_column :myusers, :domain_id, :integer
  end

  def down
		remove_column :myusers, :domain_id
  end
end
