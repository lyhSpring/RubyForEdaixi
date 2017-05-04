class CreateRegionCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :region_categories do |t|
      t.integer :region_id
      t.integer :category_id

      t.timestamps
    end
  end
end
