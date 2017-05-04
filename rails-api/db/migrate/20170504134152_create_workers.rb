class CreateWorkers < ActiveRecord::Migration[5.0]
  def change
    create_table :workers do |t|
      t.string :name
      t.string :password
      t.string :email

      t.timestamps
    end
  end
end
