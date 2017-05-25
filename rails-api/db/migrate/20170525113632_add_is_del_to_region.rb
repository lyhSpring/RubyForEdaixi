class AddIsDelToRegion < ActiveRecord::Migration[5.0]
  def change
    add_column :regions, :is_del, :integer
  end
end
