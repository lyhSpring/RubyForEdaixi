class CreateDiscountRules < ActiveRecord::Migration[5.0]
  def change
    create_table :discount_rules do |t|
      t.integer :type
      t.integer :base_money
      t.integer :added_money
      t.date :from_date
      t.date :end_date

      t.timestamps
    end
  end
end
