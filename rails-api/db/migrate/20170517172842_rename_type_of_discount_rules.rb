class RenameTypeOfDiscountRules < ActiveRecord::Migration[5.0]
  def change
  	rename_column :discount_rules, :type, :rule_type
  end
end
