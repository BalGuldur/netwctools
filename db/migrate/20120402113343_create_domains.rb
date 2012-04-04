class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :name
      t.string :descr
      t.integer :myuser_id

      t.timestamps
    end
  end
end
