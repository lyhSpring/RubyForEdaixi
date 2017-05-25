class ChangeIsDelOfRegionToStatus < ActiveRecord::Migration[5.0]
  def change
  	rename_column :regions, :is_del, :status
  end
end
