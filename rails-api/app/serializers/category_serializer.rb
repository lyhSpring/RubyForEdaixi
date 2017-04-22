class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :logo, :is_del
end
