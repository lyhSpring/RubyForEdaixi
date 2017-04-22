class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :logo
      t.string :is_del
      t.integer :categories_id

      t.timestamps
    end
  end
end
