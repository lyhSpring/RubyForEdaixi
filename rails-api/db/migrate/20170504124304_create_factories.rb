class CreateFactories < ActiveRecord::Migration[5.0]
  def change
    create_table :factories do |t|
      t.string :name
      t.string :mobile
      t.integer :status
      t.string :email
      t.string :password
      t.integer :station_id

      t.timestamps
    end
  end
end
