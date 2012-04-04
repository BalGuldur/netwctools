class Changedomidnauserid < ActiveRecord::Migration
  def up
		add_column :domains, :myuser_id, :integer
		remove_column :myusers, :domain_id
  end

  def down
		add_column :myusers, :domain_id, :integer
		remove_column :domains, :myuser_id
  end
end
