class StationSerializer < ActiveModel::Serializer
  attributes :id, :name, :region_id, :factory
end
