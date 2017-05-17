class DiscountRuleSerializer < ActiveModel::Serializer
  attributes :id, :rule_type, :base_money, :added_money, :from_date, :end_date
end
