class CardSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :true_money, :fake_money, :turnovers
end
