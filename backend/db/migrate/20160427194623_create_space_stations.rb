class CreateSpaceStations < ActiveRecord::Migration
  def change
    create_table :space_stations do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
