class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :password, :email, :mobile, :role, :station_id
end
