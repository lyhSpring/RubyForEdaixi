class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :password, :email, :mobile, :role, :station_id, :card_id, :card
end
