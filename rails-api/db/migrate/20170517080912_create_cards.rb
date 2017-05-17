class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.integer :user_id
      t.integer :true_money
      t.integer :fake_money

      t.timestamps
    end
  end
end
