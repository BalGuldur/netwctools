class Adduseridinvino < ActiveRecord::Migration
  def up
    add_column :vinos, :myuser_id, :integer
  end

  def down
    remove_column :vinos, :myuser_id
  end
end
