class CreateTerminatePoints < ActiveRecord::Migration
  def change
    create_table :terminate_points do |t|
      t.string :routerip
      t.string :routermac

      t.timestamps
    end
  end
end
