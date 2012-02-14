class CreateIps < ActiveRecord::Migration
  def change
    create_table :ips do |t|
      t.string :ipaddress
      t.string :state

      t.timestamps
    end
  end
end
