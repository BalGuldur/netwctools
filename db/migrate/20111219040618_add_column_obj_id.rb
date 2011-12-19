class AddColumnObjId < ActiveRecord::Migration
  def up
    add_column :swmodels, :objid, :string
  end

  def down
    remove_column :swmodels, :objid
  end
end
