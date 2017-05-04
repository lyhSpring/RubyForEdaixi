class CreateWorkerRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :worker_roles do |t|
      t.integer :role_id
      t.integer :worker_id

      t.timestamps
    end
  end
end
