class Deltabledomaintp < ActiveRecord::Migration
  def up
		drop_table "domains_terminate_points"
  end

  def down
		create_table "domains_terminate_points" do |t|
			t.integer :domain_id
			t.integer  "terminate_point_id"
			t.datetime "created_at"
			t.datetime "updated_at"
		end
  end
end
