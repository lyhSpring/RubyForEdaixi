class AddressSerializer < ActiveModel::Serializer
  attributes :id, :comment, :addressable_id, :addressable_type, :user_id, :order_id
end
