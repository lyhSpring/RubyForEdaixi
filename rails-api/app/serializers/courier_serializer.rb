class CourierSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :email, :mobile, :password, :station_id, :settlement
end
