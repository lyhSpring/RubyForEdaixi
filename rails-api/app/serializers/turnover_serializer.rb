class TurnoverSerializer < ActiveModel::Serializer
  attributes :id, :turnover_type, :true_money, :fake_money, :card_id
end
