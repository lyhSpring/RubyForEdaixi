class FactorySerializer < ActiveModel::Serializer
  attributes :id, :name, :mobile, :status, :email, :password, :station_id
end
