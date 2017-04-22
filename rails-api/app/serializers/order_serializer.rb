class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :time_exp, :washing_status, :address, :total_price
end
