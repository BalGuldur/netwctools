class Addtablemyusersdomains < ActiveRecord::Migration
  def up
		create_table :domains_myusers do |t|
			t.integer :myuser_id
			t.integer :domain_id

			t.timestamps
		end
  end

  def down
		drop_table :domains_myusers 
  end
end
