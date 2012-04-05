class Addingglobalfordomain < ActiveRecord::Migration
  def up
		add_column :domains, :globaly, :boolean
  end

  def down
		remove_column :domains, :globaly
  end
end
