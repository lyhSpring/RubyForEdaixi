class TurnoverSerializer < ActiveModel::Serializer
  attributes :id, :type, :true_money, :fake_money, :card_id
end
