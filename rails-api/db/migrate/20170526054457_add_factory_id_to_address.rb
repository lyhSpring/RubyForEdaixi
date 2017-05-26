class AddFactoryIdToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :factory_id, :integer
  end
end
