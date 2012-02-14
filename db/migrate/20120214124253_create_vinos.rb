class CreateVinos < ActiveRecord::Migration
  def change
    create_table :vinos do |t|
      t.string :vinosname
      t.string :descr
      t.integer :terminate_point_id

      t.timestamps
    end
  end
end
