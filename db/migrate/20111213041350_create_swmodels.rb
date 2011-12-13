class CreateSwmodels < ActiveRecord::Migration
  def change
    create_table :swmodels do |t|
      t.string :name
      t.string :company

      t.timestamps
    end
  end
end
