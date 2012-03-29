class CreateMyusers < ActiveRecord::Migration
  def change
    create_table :myusers do |t|
      t.string :name

      t.timestamps
    end
  end
end
