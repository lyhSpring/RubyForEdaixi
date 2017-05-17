class ChangeRuleTypeOfDiscountRule < ActiveRecord::Migration[5.0]
  def change
  	change_column :discount_rules, :rule_type, :string
  end
end
