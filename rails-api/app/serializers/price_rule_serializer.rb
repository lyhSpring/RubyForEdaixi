class PriceRuleSerializer < ActiveModel::Serializer
  attributes :id, :grade, :region_id, :category_id, :from_date
end
