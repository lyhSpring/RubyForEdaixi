class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :logo, :is_del, :categories_id, :price
end
