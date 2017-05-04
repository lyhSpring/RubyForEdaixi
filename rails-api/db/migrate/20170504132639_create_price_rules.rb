class CreatePriceRules < ActiveRecord::Migration[5.0]
  def change
    create_table :price_rules do |t|
      t.integer :grade
      t.integer :region_id
      t.integer :category_id
      t.datetime :from_date

      t.timestamps
    end
  end
end
