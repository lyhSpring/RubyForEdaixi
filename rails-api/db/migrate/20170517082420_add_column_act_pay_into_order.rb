class AddColumnActPayIntoOrder < ActiveRecord::Migration[5.0]
  def change
  	add_column :orders, :act_pay, :integer
  end
end
