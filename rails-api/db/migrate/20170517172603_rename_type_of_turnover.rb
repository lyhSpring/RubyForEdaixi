class RenameTypeOfCard < ActiveRecord::Migration[5.0]
  def change
  	rename_column :turnovers, :type, :turnover_type
  end
end
