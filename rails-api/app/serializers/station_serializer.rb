class StationSerializer < ActiveModel::Serializer
  attributes :id, :name, :region_id, :factory_name, :factory_id

  def factory_name
  	object.factories.first.factory_name
  end

  def factory_id
  	object.factories.first.id
  end
end
