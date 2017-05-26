class AddFactoryIdToStation < ActiveRecord::Migration[5.0]
  def change
    add_column :stations, :factory_id, :integer
  end
end
