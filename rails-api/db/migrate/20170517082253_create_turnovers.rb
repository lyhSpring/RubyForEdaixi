class CreateTurnovers < ActiveRecord::Migration[5.0]
  def change
    create_table :turnovers do |t|
      t.integer :type
      t.integer :true_money
      t.integer :fake_money
      t.integer :card_id

      t.timestamps
    end
  end
end
