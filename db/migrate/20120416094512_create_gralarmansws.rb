class CreateGralarmansws < ActiveRecord::Migration
  def change
    create_table :gralarmansws do |t|
      t.string :name
      t.string :comment

      t.timestamps
    end
  end
end
