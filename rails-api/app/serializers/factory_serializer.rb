 class FactorySerializer < ActiveModel::Serializer
  attributes :id, :factory_name, :mobile, :status, :email, :password, :station_id, :region_id, :address
end
