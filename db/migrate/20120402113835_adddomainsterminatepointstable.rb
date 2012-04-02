class Adddomainsterminatepointstable < ActiveRecord::Migration
	def change
		create_table :domains_terminate_points do |t|
			t.integer :domain_id
			t.integer :terminate_point_id

			t.timestamps
		end
	end
end
