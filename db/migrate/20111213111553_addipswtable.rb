class Addipswtable < ActiveRecord::Migration
  def change
    create_table :ips_switches do |t|
      t.integer :ip_id
      t.integer :switch_id

      t.timestamps
    end
  end
end