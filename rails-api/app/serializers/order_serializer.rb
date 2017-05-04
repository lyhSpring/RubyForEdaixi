class OrderSerializer < ActiveModel::Serializer
  attributes :id, :courier_id, :washing_status, :factory_id, :waybill_id, :voucher_status, :categories_id, :status, :address_id, :totalprice, :user_id
end
