class Adddescrtotp < ActiveRecord::Migration
  def up
    add_column :terminate_points, :descr, :string
  end

  def down
    remove_column :terminate_points, :descr
  end
end
