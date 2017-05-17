class DiscountRuleSerializer < ActiveModel::Serializer
  attributes :id, :type, :base_money, :added_money, :from_date, :end_date
end
