class CreateOutins < ActiveRecord::Migration
  def change
    create_table :outins do |t|
      t.string :nameis
      t.string :oborudovanie
      t.string :bridgedomain

      t.timestamps
    end
  end
end
