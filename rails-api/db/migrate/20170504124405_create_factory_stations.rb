class CreateFactoryStations < ActiveRecord::Migration[5.0]
  def change
    create_table :factory_stations do |t|
      t.integer :factory_id
      t.integer :station_id

      t.timestamps
    end
  end
end
