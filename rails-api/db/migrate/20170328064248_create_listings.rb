class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.text :context
      t.string :title

      t.timestamps
    end
  end
end
