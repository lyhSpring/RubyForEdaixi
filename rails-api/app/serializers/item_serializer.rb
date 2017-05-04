class ItemSerializer < ActiveModel::Serializer
  attributes :id, :product_id, :order_id, :product_number, :total_price
end
