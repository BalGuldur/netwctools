class Deluseridformdomain < ActiveRecord::Migration
  def up
		remove_column :domains, :myuser_id
  end

  def down
		add_column :domains, :myuser_id, :integer
  end
end
