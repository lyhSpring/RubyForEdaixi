class WorkerSerializer < ActiveModel::Serializer
  attributes :id, :name, :password, :email
end
