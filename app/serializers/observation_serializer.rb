class ObservationSerializer < ActiveModel::Serializer
  attributes :id, :temp, :humidity, :pressure, :created_at
end
