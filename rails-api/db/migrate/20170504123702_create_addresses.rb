class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :comment
      t.integer :addressable_id
      t.string :addressable_type
      t.integer :user_id
      t.integer :order_id

      t.timestamps
    end
  end
end
