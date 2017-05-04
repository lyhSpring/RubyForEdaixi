class WaybillSerializer < ActiveModel::Serializer
  attributes :id, :sender_type, :sender_id, :status, :recieve_id, :exp_time, :actual_time, :waybill_id, :order_id
end
