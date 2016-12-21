class ObservationSerializer < ActiveModel::Serializer
  attributes :id, :temp, :humidity, :pressure
end
