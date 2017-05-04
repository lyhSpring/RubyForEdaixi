class CreateCouriers < ActiveRecord::Migration[5.0]
  def change
    create_table :couriers do |t|
      t.string :name
      t.integer :status
      t.string :email
      t.string :mobile
      t.string :password
      t.integer :station_id

      t.timestamps
    end
  end
end
