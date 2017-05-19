class SettlementSerializer < ActiveModel::Serializer
  attributes :id, :settled, :unsettled, :money_settled, :money_unsettled, :courier_id
end
