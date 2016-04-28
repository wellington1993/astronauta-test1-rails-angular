class CreateAstronauts < ActiveRecord::Migration
  def change
    create_table :astronauts do |t|
      t.string :name
      t.datetime :birthdate
      t.belongs_to :mission, index: true, foreign_key: true
      t.belongs_to :space_station, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
